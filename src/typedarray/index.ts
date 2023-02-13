// Source: https://github.com/es-shims/typedarray
//
// Copyright (c) 2010, Linden Research, Inc.
// Copyright (c) 2012, Joshua Bell
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

// Original can be found at:
//   https://bitbucket.org/lindenlab/llsd
// Modifications by Joshua Bell inexorabletash@gmail.com
//   https://github.com/inexorabletash/polyfill

// ES3/ES5 implementation of the Krhonos Typed Array Specification
//   Ref: http://www.khronos.org/registry/typedarray/specs/latest/
//   Date: 2011-02-01
//
// Variations:
//  * Allows typed_array.get/set() as alias for subscripts (typed_array[])

const globalNamespace = (_G as any)

// Beyond this value, index getters/setters (i.e. array[0], array[1]) are so slow to
// create, and consume so much memory, that the browser appears frozen.
const MAX_ARRAY_LENGTH = 1e5;


// Stash a copy in case other scripts modify these
const toString = (o: Object) => o.toString()
// const hasProp = (o: Object, f: string | number) => o.hasOwnProperty(f)

// Approximations of internal ECMAScript conversion functions
// Class returns internal [[Class]] property, used to avoid cross-frame instanceof issues:
/** @noSelf */
const ECMA_Class = (v: any) => { return toString(v).replace('[object ', '').replace(']', ''); }
// const ECMA_HasProperty = (o: any, p: string | number) => { return p in o; }
// const ECMA_HasOwnProperty = (o: any, p: string | number) => { return hasProp(o, p); }
// const ECMA_IsCallable = (o: any) => { return typeof o === 'function'; }
/** @noSelf */
const ECMA_ToInt32 = (v: number = 0) => { return v >> 0; }
/** @noSelf */
const ECMA_ToUint32 = (v: number = 0) => { return v >>> 0; }

const LN2 = Math.LN2;

/** @noSelf */
function clamp(v: number, minimum: number, max: number) { return v < minimum ? minimum : v > max ? max : v; }

// emulate ES5 getter/setter API using legacy APIs
// http://blogs.msdn.com/b/ie/archive/2010/09/07/transitioning-existing-code-to-the-es5-getter-setter-apis.aspx
// (second clause tests for Object.defineProperty() in IE<9 that only supports extending DOM prototypes, but
// note that IE<9 does not support __defineGetter__ or __defineSetter__ so it just renders the method harmless)
// const defineProp = (o: Object, prop: any, descriptor: any) =>
//   Object.defineProperty(o, prop, descriptor);

// ES5: Make obj[index] an alias for obj._getter(index)/obj._setter(index, value)
// for index in 0 ... obj.length
// function makeArrayAccessors(obj: Record<string, any>) {
//   if (!defineProp) { return; }
//
//   if (obj.length > MAX_ARRAY_LENGTH) { throw new RangeError('Array too large for polyfill'); }
//
//   function makeArrayAccessor(index: number) {
//     defineProp(obj, index, {
//       get: function () { return obj._getter(index); },
//       set: function (v: number) { obj._setter(index, v); },
//       enumerable: true,
//       configurable: false
//     });
//   }
//
//   for (let i = 0; i < obj.length; i += 1) {
//     makeArrayAccessor(i);
//   }
// }

// Internal conversion functions:
//    pack<Type>()   - take a number (interpreted as Type), output a byte array
//    unpack<Type>() - take a byte array, output a Type-like number

type PackFn = (n: number) => number[]
type UnpackFn = (n: number[]) => number

function as_signed(value: number, bits: number) { let s = 32 - bits; return (value << s) >> s; }
function as_unsigned(value: number, bits: number) { let s = 32 - bits; return (value << s) >>> s; }

function packI8(n: number) { return [n & 0xff]; }
function unpackI8(bytes: number[]) { return as_signed(bytes[0], 8); }

function packU8(n: number) { return [n & 0xff]; }
function unpackU8(bytes: number[]) { return as_unsigned(bytes[0], 8); }

function packU8Clamped(n: number) { n = Math.round(Number(n)); return [n < 0 ? 0 : n > 0xff ? 0xff : n & 0xff]; }

function packI16(n: number) { return [(n >> 8) & 0xff, n & 0xff]; }
function unpackI16(bytes: number[]) { return as_signed(bytes[0] << 8 | bytes[1], 16); }

function packU16(n: number) { return [(n >> 8) & 0xff, n & 0xff]; }
function unpackU16(bytes: number[]) { return as_unsigned(bytes[0] << 8 | bytes[1], 16); }

function packI32(n: number) {
  return [
    (n >> 24) & 0xff, (n >> 16) & 0xff, (n >> 8) & 0xff, n & 0xff
  ];
}
function unpackI32(bytes: number[]) { return as_signed(bytes[0] << 24 | bytes[1] << 16 | bytes[2] << 8 | bytes[3], 32); }

function packU32(n: number) {
  return [
    (n >> 24) & 0xff, (n >> 16) & 0xff, (n >> 8) & 0xff, n & 0xff
  ];
}
function unpackU32(bytes: number[]) { return as_unsigned(bytes[0] << 24 | bytes[1] << 16 | bytes[2] << 8 | bytes[3], 32); }

function packIEEE754(v: number, ebits: number, fbits: number) {

  let bias = (1 << (ebits - 1)) - 1;
  let s, e, f, i, bytes;
  let str = ''

  function roundToEven(n: number) {
    let w = Math.floor(n);
    let fl = n - w;
    if (fl < 0.5) { return w; }
    if (fl > 0.5) { return w + 1; }
    return (w % 2) !== 0 ? w + 1 : w;
  }

  // Compute sign, exponent, fraction
  if (v !== v) {
    // NaN
    // http://dev.w3.org/2006/webapi/WebIDL/#es-type-mapping
    e = (1 << ebits) - 1; f = Math.pow(2, fbits - 1); s = 0;
  } else if (v === Infinity || v === -Infinity) {
    e = (1 << ebits) - 1; f = 0; s = v < 0 ? 1 : 0;
  } else if (v === 0) {
    e = 0; f = 0; s = 1 / v === -Infinity ? 1 : 0;
  } else {
    s = v < 0;
    v = Math.abs(v);

    if (v >= Math.pow(2, 1 - bias)) {
      e = Math.min(Math.floor(Math.log(v) / LN2), 1023);
      f = roundToEven(v / Math.pow(2, e) * Math.pow(2, fbits));
      if (f / Math.pow(2, fbits) >= 2) {
        e = e + 1;
        f = 1;
      }
      if (e > bias) {
        // Overflow
        e = (1 << ebits) - 1;
        f = 0;
      } else {
        // Normalized
        e = e + bias;
        f = f - Math.pow(2, fbits);
      }
    } else {
      // Denormalized
      e = 0;
      f = roundToEven(v / Math.pow(2, 1 - bias - fbits));
    }
  }

  // Pack sign, exponent, fraction
  const bits = [];

  for (i = fbits; i > 0; i -= 1) { bits.push((f % 2) !== 0 ? 1 : 0); f = Math.floor(f / 2); }
  for (i = ebits; i > 0; i -= 1) { bits.push((e % 2) !== 0 ? 1 : 0); e = Math.floor(e / 2); }

  bits.push(s ? 1 : 0);
  bits.reverse();
  str = bits.join('');

  // Bits to bytes
  bytes = [];
  while (str.length > 0) {
    bytes.push(parseInt(str.substring(0, 8), 2));
    str = str.substring(8);
  }
  return bytes;
}

function unpackIEEE754(bytes: number[], ebits: number, fbits: number) {

  // Bytes to bits
  let bits = [],
    i, j, b, str,
    bias, s, e, f;

  for (i = bytes.length; i; i -= 1) {
    b = bytes[i - 1];
    for (j = 8; j; j -= 1) {
      bits.push((b % 2) !== 0 ? 1 : 0); b = b >> 1;
    }
  }
  bits.reverse();
  str = bits.join('');

  // Unpack sign, exponent, fraction
  bias = (1 << (ebits - 1)) - 1;
  s = parseInt(str.substring(0, 1), 2) !== 0 ? -1 : 1;
  e = parseInt(str.substring(1, 1 + ebits), 2);
  f = parseInt(str.substring(1 + ebits), 2);

  // Produce number
  if (e === (1 << ebits) - 1) {
    return f === 0 ? s * Infinity : NaN;
  } else if (e > 0) {
    // Normalized
    return s * Math.pow(2, e - bias) * (1 + (f / Math.pow(2, fbits)));
  } else if (f !== 0) {
    // Denormalized
    return s * Math.pow(2, -(bias - 1)) * (f / Math.pow(2, fbits));
  }
  return s < 0 ? -0 : 0;

}

function unpackF64(b: number[]) { return unpackIEEE754(b, 11, 52); }
function packF64(v: number) { return packIEEE754(v, 11, 52); }
function unpackF32(b: number[]) { return unpackIEEE754(b, 8, 23); }
function packF32(v: number) { return packIEEE754(v, 8, 23); }

//
// 3 The ArrayBufferClass Type
//

class ArrayBufferClass {
  byteLength: number
  _bytes: number[]

  constructor(length: number) {
    length = ECMA_ToInt32(length);
    if (length < 0) { throw new RangeError('ArrayBufferClass size is not a small enough positive integer'); }

    this.byteLength = length;
    this._bytes = [];
    this._bytes.length = length;

    for (let i = 0; i < this.byteLength; i += 1) {
      this._bytes[i] = 0;
    }
  }
}

globalNamespace.ArrayBuffer = ArrayBufferClass

//
// 4 The ArrayBufferView Type
//

// NOTE: this constructor is not exported
class ArrayBufferView {
  buffer: ArrayBufferClass
  byteOffset: number
  byteLength: number

  constructor(buffer: ArrayBufferClass, byteOffset: number, byteLength: number) {
    this.buffer = buffer
    this.byteOffset = byteOffset
    this.byteLength = byteLength
  }
}

//
// 5 The Typed Array View Types
//

function makeConstructor(bytesPerElement: number, pack: PackFn, unpack: UnpackFn) {
  // Each TypedArray type requires a distinct constructor instance with
  // identical logic, which this produces.


  class TypedArrayClass extends ArrayBufferView {
    length: number

    static BYTES_PER_ELEMENT = bytesPerElement
    BYTES_PER_ELEMENT = bytesPerElement
    _pack = pack
    _unpack = unpack

    constructor(buffer: TypedArrayClass | ArrayBufferClass | number, byteOffset: number, length?: number) {
      let i, s;

      if (typeof buffer === 'number') {
        // Constructor(unsigned long length)
        const ownLength = length ?? 0
        if (ownLength < 0) { throw new RangeError('ArrayBufferView size is not a small enough positive integer'); }

        const byteLength = ownLength * bytesPerElement

        super(new ArrayBuffer(byteLength) as any, 0, ownLength)

        this.byteLength = byteLength;
        this.length = ECMA_ToInt32(buffer);

      } else if (typeof buffer === 'object' && buffer.constructor === TypedArrayClass) {
        // Constructor(TypedArray array)

        const length = buffer.length
        const byteLength = length * bytesPerElement
        const ownBuffer = new ArrayBuffer(byteLength) as any

        super(ownBuffer, 0, byteLength)
        this.length = length

        for (i = 0; i < this.length; i += 1) {
          this._setter(i, buffer._getter(i));
        }
      } else if (typeof buffer === 'object'
          && !(buffer instanceof ArrayBuffer || ECMA_Class(buffer) === 'ArrayBuffer')) {
        // Constructor(sequence<type> array)
        const sequence = buffer;

        const length = ECMA_ToUint32((sequence as any).length);
        const byteLength = length * bytesPerElement;
        const ownBuffer = new ArrayBuffer(byteLength) as any;

        super(ownBuffer, 0, byteLength)
        this.length = length

        for (let i = 0; i < this.length; i += 1) {
          s = (sequence as any)[i];
          this._setter(i, Number(s));
        }
      } else if (typeof buffer === 'object'
                  && (buffer instanceof ArrayBuffer || ECMA_Class(buffer) === 'ArrayBuffer')) {
        // Constructor(ArrayBuffer buffer,
        //             optional unsigned long byteOffset, optional unsigned long length)

        super(buffer as any, ECMA_ToUint32(byteOffset), buffer.byteLength)

        if (this.byteOffset > this.buffer.byteLength) {
          throw new RangeError('byteOffset out of range');
        }

        if (this.byteOffset % this.BYTES_PER_ELEMENT !== 0) {
          // The given byteOffset must be a multiple of the element
          // size of the specific type, otherwise an exception is raised.
          throw new RangeError('ArrayBuffer length minus the byteOffset is not a multiple of the element size.');
        }

        if (length === undefined) {
          this.byteLength = this.buffer.byteLength - this.byteOffset;

          if (this.byteLength % this.BYTES_PER_ELEMENT !== 0) {
            throw new RangeError('length of buffer minus byteOffset not a multiple of the element size');
          }
          this.length = this.byteLength / this.BYTES_PER_ELEMENT;
        } else {
          this.length = ECMA_ToUint32(length);
          this.byteLength = this.length * this.BYTES_PER_ELEMENT;
        }

        if ((this.byteOffset + this.byteLength) > this.buffer.byteLength) {
          throw new RangeError('byteOffset and length reference an area beyond the end of the buffer');
        }
      } else {
        throw new TypeError('Unexpected argument type(s)');
      }

      this.constructor = TypedArrayClass;

      // makeArrayAccessors(this);
    }

    [key: string | number | symbol]: any;

    __index(key: any) {
      if (key in TypedArrayClass.prototype)
          return TypedArrayClass.prototype[key as keyof typeof TypedArrayClass.prototype] as any
      return this._getter(key)
    }

    __newindex(key: any, value: number) {
      if (typeof key === 'string') {
        rawset(this, key, value as any)
      } else {
        this._setter(key, value)
      }
      return value
    }

    // getter type (unsigned long index);
    _getter(index: number): number {
      index = ECMA_ToUint32(index);
      if (index >= this.length) {
        return 0;
      }

      const buffer = this.buffer;
      let bytes = [];
      let i = 0
      let o = this.byteOffset + (index * this.BYTES_PER_ELEMENT)
      for (; i < this.BYTES_PER_ELEMENT; i += 1, o += 1) {
        bytes.push(buffer._bytes[o]);
      }
      const _unpack = rawget(this, '_unpack')
      return _unpack(bytes);
    }

    // NONSTANDARD: convenience alias for getter: type get(unsigned long index);
    get = this._getter

    // setter void (unsigned long index, type value);
    _setter(index: number, value: number) {
      index = ECMA_ToUint32(index);

      const length = rawget(this, 'length')
      const _pack = rawget(this, '_pack')

      if (index < length) {
        const buffer = this.buffer;
        const bytes = _pack(value);

        let i = 0;
        let o= this.byteOffset + (index * this.BYTES_PER_ELEMENT);

        for (; i < this.BYTES_PER_ELEMENT; i += 1, o += 1) {
          buffer._bytes[o] = bytes[i];
        }
      }
    };

    // void set(TypedArray array, optional unsigned long offset);
    // void set(sequence<type> array, optional unsigned long offset);
    set(index: number, value: number) { // eslint-disable-line no-unused-vars
      if (arguments.length < 1) { throw new SyntaxError('Not enough arguments'); }
      let array, sequence, offset, len,
        i, s, d,
        byteOffset, byteLength, tmp;

      if (typeof arguments[0] === 'object' && arguments[0].constructor === this.constructor) {
        // void set(TypedArray array, optional unsigned long offset);
        array = arguments[0];
        offset = ECMA_ToUint32(arguments[1]);

        if (offset + array.length > this.length) {
          throw new RangeError('Offset plus length of array is out of range');
        }

        byteOffset = this.byteOffset + (offset * this.BYTES_PER_ELEMENT);
        byteLength = array.length * this.BYTES_PER_ELEMENT;

        if (array.buffer === this.buffer) {
          tmp = [];
          for (i = 0, s = array.byteOffset; i < byteLength; i += 1, s += 1) {
            tmp[i] = array.buffer._bytes[s];
          }
          for (i = 0, d = byteOffset; i < byteLength; i += 1, d += 1) {
            (this.buffer as unknown as ArrayBufferClass)._bytes[d] = tmp[i];
          }
        } else {
          for (i = 0, s = array.byteOffset, d = byteOffset;
            i < byteLength; i += 1, s += 1, d += 1) {
            (this.buffer as unknown as ArrayBufferClass)._bytes[d] = array.buffer._bytes[s];
          }
        }
      } else if (typeof arguments[0] === 'object' && typeof arguments[0].length !== 'undefined') {
        // void set(sequence<type> array, optional unsigned long offset);
        sequence = arguments[0];
        len = ECMA_ToUint32(sequence.length);
        offset = ECMA_ToUint32(arguments[1]);

        if (offset + len > this.length) {
          throw new RangeError('Offset plus length of array is out of range');
        }

        for (i = 0; i < len; i += 1) {
          s = sequence[i];
          this._setter(offset + i, Number(s));
        }
      } else {
        throw new TypeError('Unexpected argument type(s)');
      }
    };

    // TypedArray subarray(long begin, optional long end);
    subarray(start: number, end: number) {

      start = ECMA_ToInt32(start);
      end = ECMA_ToInt32(end);

      if (arguments.length < 1) { start = 0; }
      if (arguments.length < 2) { end = this.length; }

      if (start < 0) { start = this.length + start; }
      if (end < 0) { end = this.length + end; }

      start = clamp(start, 0, this.length);
      end = clamp(end, 0, this.length);

      let len = end - start;
      if (len < 0) {
        len = 0;
      }

      return new TypedArrayClass(this.buffer, this.byteOffset + (start * this.BYTES_PER_ELEMENT), len);
    }

    fill(value: number) {
      for (let i = 0; i < this.length; i++) {
        this._setter(i, value)
      }
    }
  }

  return TypedArrayClass;
}

export const Int8Array = globalNamespace.Int8Array = makeConstructor(1, packI8, unpackI8);
export const Uint8Array = globalNamespace.Uint8Array = makeConstructor(1, packU8, unpackU8);
export const Uint8ClampedArray = globalNamespace.Uint8ClampedArray = makeConstructor(1, packU8Clamped, unpackU8);
export const Int16Array = globalNamespace.Int16Array = makeConstructor(2, packI16, unpackI16);
export const Uint16Array = globalNamespace.Uint16Array = makeConstructor(2, packU16, unpackU16);
export const Int32Array = globalNamespace.Int32Array = makeConstructor(4, packI32, unpackI32);
export const Uint32Array = globalNamespace.Uint32Array = makeConstructor(4, packU32, unpackU32);
export const Float32Array = globalNamespace.Float32Array = makeConstructor(4, packF32, unpackF32);
export const Float64Array = globalNamespace.Float64Array = makeConstructor(8, packF64, unpackF64);

//
// 6 The DataView View Type
//

// (function () {
//  function r(array, index) {
//    return ECMA_IsCallable(array.get) ? array.get(index) : array[index];
//  }
//
//  let IS_BIG_ENDIAN = (function () {
//    let u16array = new exports.Uint16Array([0x1234]),
//      u8array = new exports.Uint8Array(u16array.buffer);
//    return r(u8array, 0) === 0x12;
//  }());
//
//  // Constructor(ArrayBufferClass buffer,
//  //             optional unsigned long byteOffset,
//  //             optional unsigned long byteLength)
//  /** @constructor */
//  function DataView(buffer, byteOffset, byteLength) {
//    if (arguments.length === 0) {
//      buffer = new exports.ArrayBufferClass(0);
//    } else if (!(buffer instanceof exports.ArrayBufferClass || ECMA_Class(buffer) === 'ArrayBufferClass')) {
//      throw new TypeError('TypeError');
//    }
//
//    this.buffer = buffer || new exports.ArrayBufferClass(0);
//
//    this.byteOffset = ECMA_ToUint32(byteOffset);
//    if (this.byteOffset > this.buffer.byteLength) {
//      throw new RangeError('byteOffset out of range');
//    }
//
//    if (arguments.length < 3) {
//      this.byteLength = this.buffer.byteLength - this.byteOffset;
//    } else {
//      this.byteLength = ECMA_ToUint32(byteLength);
//    }
//
//    if ((this.byteOffset + this.byteLength) > this.buffer.byteLength) {
//      throw new RangeError('byteOffset and length reference an area beyond the end of the buffer');
//    }
//
//  }
//
//  function makeGetter(arrayType) {
//    return function (byteOffset, littleEndian) {
//
//      byteOffset = ECMA_ToUint32(byteOffset);
//
//      if (byteOffset + arrayType.BYTES_PER_ELEMENT > this.byteLength) {
//        throw new RangeError('Array index out of range');
//      }
//      byteOffset += this.byteOffset;
//
//      let uint8Array = new exports.Uint8Array(this.buffer, byteOffset, arrayType.BYTES_PER_ELEMENT),
//        bytes = [],
//        i;
//      for (i = 0; i < arrayType.BYTES_PER_ELEMENT; i += 1) {
//        bytes.push(r(uint8Array, i));
//      }
//
//      if (Boolean(littleEndian) === Boolean(IS_BIG_ENDIAN)) {
//        bytes.reverse();
//      }
//
//      return r(new arrayType(new exports.Uint8Array(bytes).buffer), 0);
//    };
//  }
//
//  DataView.prototype.getUint8 = makeGetter(exports.Uint8Array);
//  DataView.prototype.getInt8 = makeGetter(exports.Int8Array);
//  DataView.prototype.getUint16 = makeGetter(exports.Uint16Array);
//  DataView.prototype.getInt16 = makeGetter(exports.Int16Array);
//  DataView.prototype.getUint32 = makeGetter(exports.Uint32Array);
//  DataView.prototype.getInt32 = makeGetter(exports.Int32Array);
//  DataView.prototype.getFloat32 = makeGetter(exports.Float32Array);
//  DataView.prototype.getFloat64 = makeGetter(exports.Float64Array);
//
//  function makeSetter(arrayType) {
//    return function (byteOffset, value, littleEndian) {
//
//      byteOffset = ECMA_ToUint32(byteOffset);
//      if (byteOffset + arrayType.BYTES_PER_ELEMENT > this.byteLength) {
//        throw new RangeError('Array index out of range');
//      }
//
//      // Get bytes
//      let typeArray = new arrayType([value]),
//        byteArray = new exports.Uint8Array(typeArray.buffer),
//        bytes = [],
//        i, byteView;
//
//      for (i = 0; i < arrayType.BYTES_PER_ELEMENT; i += 1) {
//        bytes.push(r(byteArray, i));
//      }
//
//      // Flip if necessary
//      if (Boolean(littleEndian) === Boolean(IS_BIG_ENDIAN)) {
//        bytes.reverse();
//      }
//
//      // Write them
//      byteView = new exports.Uint8Array(this.buffer, byteOffset, arrayType.BYTES_PER_ELEMENT);
//      byteView.set(bytes);
//    };
//  }
//
//  DataView.prototype.setUint8 = makeSetter(exports.Uint8Array);
//  DataView.prototype.setInt8 = makeSetter(exports.Int8Array);
//  DataView.prototype.setUint16 = makeSetter(exports.Uint16Array);
//  DataView.prototype.setInt16 = makeSetter(exports.Int16Array);
//  DataView.prototype.setUint32 = makeSetter(exports.Uint32Array);
//  DataView.prototype.setInt32 = makeSetter(exports.Int32Array);
//  DataView.prototype.setFloat32 = makeSetter(exports.Float32Array);
//  DataView.prototype.setFloat64 = makeSetter(exports.Float64Array);
//
//  exports.DataView = exports.DataView || DataView;
//
// }());
