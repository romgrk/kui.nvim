import * as cairo from 'kui.cairo.cairo'
import { Color, ColorSource } from 'src/color'

import { LineCap, LineJoin } from 'kui.cairo.cairo'
export { LineCap, LineJoin } from 'kui.cairo.cairo'

export type DOMMatrix = {
  a: number,
  b: number,
  c: number,
  d: number,
  e: number,
  f: number,
}

export type CompositeOperation =
  | 'source-over'
  | 'source-in'
  | 'source-out'
  | 'source-atop'
  | 'destination-over'
  | 'destination-in'
  | 'destination-out'
  | 'destination-atop'
  | 'xor'
  | 'color'
  | 'color-burn'
  | 'color-dodge'
  | 'darken'
  | 'difference'
  | 'exclusion'
  | 'hard-light'
  | 'hue'
  | 'lighten'
  | 'lighter'
  | 'luminosity'
  | 'multiply'
  | 'overlay'
  | 'saturation'
  | 'screen'
  | 'soft-light'

type TextMetrics = {
  width: number
  height: number
}

export class Context2D {
  surface: cairo.Surface
  context: cairo.Context

  private _width: number
  private _height: number

  private _globalCompositeOperation: CompositeOperation
  private _globalAlpha: number
  private _fillColor: Color
  private _strokeColor: Color
  private _font: string

  constructor(width: number, height: number) {
    this.surface = cairo.image_surface('argb32', width, height)
    this.context = this.surface.context()

    this._width = width
    this._height = height

    this._globalCompositeOperation = 'source-over'
    this._globalAlpha = 1.0
    this._fillColor = new Color(0x000000)
    this._strokeColor = new Color(0x000000)
    this._font = '10x sans-serif'
  }

  get width() { return this._width }
  set width(width: number) { this.setDimensions(width, this._height) }
  get height() { return this._height }
  set height(height: number) { this.setDimensions(this._width, height) }

  setDimensions(width: number, height: number) {
    const surface = cairo.image_surface('argb32', width, height)
    const context = surface.context()
    this.surface.flush()
    context.source(this.surface)
    context.paint()
    this.surface = surface
    this.context = context
    this._width = width
    this._height = height
  }

  // canvas
  // direction

  get globalCompositeOperation() { return this._globalCompositeOperation }
  set globalCompositeOperation(value: CompositeOperation) { this._globalCompositeOperation = value }

  get globalAlpha() { return this._globalAlpha }
  set globalAlpha(value: number) { this._globalAlpha = value }

  get fillStyle(): string { return this._fillColor.toHex() }
  set fillStyle(color: ColorSource) { this._fillColor = new Color(color) }
  private _fill() {
    this.context.rgba(
      this._fillColor.red,
      this._fillColor.green,
      this._fillColor.blue,
      this._fillColor.alpha * this._globalAlpha,
    )
    this.context.fill()
  }

  get strokeStyle() { return this._strokeColor }
  set strokeStyle(color: ColorSource) { this._strokeColor = new Color(color) }
  private _stroke() {
    this.context.rgba(
      this._strokeColor.red,
      this._strokeColor.green,
      this._strokeColor.blue,
      this._strokeColor.alpha * this._globalAlpha,
    )
    this.context.stroke()
  }

  get font() { return this._font }
  set font(value: string) {
    this._font = value
    const [size, name, style, weight] = parseFont(value)
    this.context.font_face(name, style, weight)
    this.context.font_size(size)
  }

  get lineCap() { return this.context.line_cap() }
  set lineCap(value: LineCap) { this.context.line_cap(value) }

  get lineJoin() { return this.context.line_join() }
  set lineJoin(value: LineJoin) { this.context.line_join(value) }

  get lineWidth() { return this.context.line_width() }
  set lineWidth(value: number) { this.context.line_width(value) }

  get miterLimit() { return this.context.miter_limit() }
  set miterLimit(value: number) { this.context.miter_limit(value) }

  // filter
  // font
  // fontKerning
  // fontStretch
  // fontVariantCaps
  // globalCompositeOperation
  // imageSmoothingEnabled
  // imageSmoothingQuality
  // letterSpacing
  get letterSpacing() { return '0px' }
  set letterSpacing(value: string) { /* TODO: unimplemented */ }
  // lineDashOffset
  // shadowBlur
  // shadowColor
  // shadowOffsetX
  // shadowOffsetY
  // textAlign
  // textBaseline
  // textRendering
  // wordSpacing

  arc(x: number, y: number, radius: number, startAngle: number, endAngle: number, counterclockwise?: boolean) {
    if (!counterclockwise)
      this.context.arc(x, y, radius, startAngle, endAngle)
    else
      this.context.arc_negative(x, y, radius, startAngle, endAngle)
  }
  // arcTo()
  beginPath() { this.context.new_path() }
  bezierCurveTo(x1: number, y1: number, x2: number, y2: number, x3: number, y3: number) { this.context.curve_to(x1, y1, x2, y2, x3, y3) }
  clip() { this.context.clip() }
  closePath() { this.context.close_path() }
  // createConicGradient()
  // createImageData()
  // createLinearGradient()
  // createPattern()
  // createRadialGradient()
  // drawFocusIfNeeded()
  // drawImage()
  ellipse(x: number, y: number, radiusX: number, radiusY: number, rotation: number, startAngle: number, endAngle: number, counterclockwise?: boolean) {
    if (!counterclockwise)
      this.context.elliptic_arc(x, y, radiusX, radiusY, rotation, startAngle, endAngle)
    else
      this.context.elliptic_arc_negative(x, y, radiusX, radiusY, rotation, startAngle, endAngle)
  }
  fill() { this.context.fill() }
  fillText(text: string, x: number, y: number) {
    this.context.move_to(x, y)
    this.context.text_path(text)
    this._fill()
  }
  // getContextAttributes()
  getImageData(x: number, y: number, width: number, height: number) {
    const isSameDimensions =
      x !== 0 && y !== 0 && width !== this._width && height !== this._height

    if (isSameDimensions) {
      const length = width * height * 4
      const arrayLike = setmetatable(this.surface.data(), {
        __len: () => length,
      })

      return new ImageData(width, height, arrayLike)
    } else {
      const surface = cairo.image_surface('argb32', width, height)
      const context = surface.context()
      context.source(this.surface, -x, -y)
      context.paint()

      const length = width * height * 4
      const arrayLike = setmetatable(surface.data(), {
        __len: () => length,
      })

      return new ImageData(width, height, arrayLike, [surface, context])
    }
  }
  putImageData(image: ImageData, dx: number, dy: number) {
    const surface = cairo.image_surface_from_data(
      'argb32', image.data, image.width, image.height, 4
    )
    this.context.source(surface, -dx, -dy)
    this.context.paint()
  }
  // getLineDash()
  // isContextLost()
  // isPointInPath()
  // isPointInStroke()
  lineTo(x: number, y: number) { this.context.line_to(x, y) }
  measureText(text: string): TextMetrics { return this.context.text_extents(text) }
  moveTo(x: number, y: number) { this.context.move_to(x, y) }
  quadraticCurveTo(x1: number, y1: number, x2: number, y2: number) { this.context.quad_curve_to(x1, y1, x2, y2) }
  // reset()
  // resetTransform()
  roundRect(x: number, y: number, width: number, height: number, radius: number) {
    this.context.rounded_rectangle(x, y, width, height, radius)
  }
  // scrollPathIntoView()
  // setLineDash()
  stroke() { this.context.stroke() }
  strokeText(text: string, x: number, y: number) {
    this.context.move_to(x, y)
    this.context.text_path(text)
    this._stroke()
  }

  save() { this.context.save() }
  restore() { this.context.restore() }


  rect(x: number, y: number, width: number, height: number) {
    this.context.rectangle(x, y, width, height)
  }
  clearRect(x: number, y: number, width: number, height: number) {
    this.context.save()
    this.context.rectangle(x, y, width, height)
    this.context.clip()
    this.context.paint_with_alpha(0.0)
    this.context.restore()
  }
  fillRect(x: number, y: number, width: number, height: number) {
    this.context.rectangle(x, y, width, height)
    this._fill()
  }
  strokeRect(x: number, y: number, width: number, height: number) {
    this.context.rectangle(x, y, width, height)
    this._stroke()
  }

  scale(x: number, y: number) { this.context.scale(x, y) }
  translate(x: number, y: number) { this.context.translate(x, y) }
  rotate(rads: number) { this.context.rotate(rads) }
  transform(a: number, b: number, c: number, d: number, e: number, f: number) {
    this.context.transform(cairo.matrix(a, b, c, d, e, f))
  }

  setTransform(a: number, b: number, c: number, d: number, e: number, f: number) {
    this.context.set_matrix(cairo.matrix(a, b, c, d, e, f))
  }

  getTransform(): DOMMatrix {
    throw new Error('unimplemented')
  }

  // Non-standard methods

  getFontExtents() { return this.context.font_extents() }
}

export class Canvas {
  context: Context2D

  constructor(width: number, height: number) {
    this.context = new Context2D(width, height)
  }

  get width() { return this.context.width }
  set width(value: number) { this.context.width = value }

  get height() { return this.context.height }
  set height(value: number) { this.context.height = value }

  /** Non-standard method to resize in one step */
  setDimensions(width: number, height: number) {
    this.context.setDimensions(width, height)
  }

  getContext(_name: '2d') {
    return this.context
  }
}

export class ImageData {
  readonly width: number
  readonly height: number
  data: number[]

  private _refs?: any[]

  constructor(
    width: number,
    height: number,
    data: number[],
    refs?: any[],
  ) {
    this.width = width
    this.height = height
    this.data = data
    this._refs = refs
  }
}


let defaultFontName = 'sans-serif'

export function setDefaultFontName(n: string) {
  defaultFontName = n
}

// FIXME: need to fill these accurately
const FONT_NAMES = {
  'serif':      'Cantarell',
  'sans-serif': 'Cantarell',
  'monospace':  'DejaVu Sans Mono',
}

const FONT_WEIGHT_NAMES = {
  100: 'normal',
  200: 'normal',
  300: 'normal',
  400: 'normal',
  500: 'normal',
  bold: 'bold',
  600: 'bold',
  700: 'bold',
  800: 'bold',
  900: 'bold',
}

const FONT_STYLE_NAMES = {
  italic:  'italic',
  oblique: 'oblique',
}

function parseFont(fontStyle: string) {
  let size = 10
  let name = defaultFontName
  let style = 'normal'
  let weight = 'normal'
  const parts = fontStyle.split(' ').map(s => s.trim())
  for (const part of parts) {
    if (part.endsWith('px'))
      size = parseInt(part.slice(0, -2), 10)
    else if (part in FONT_STYLE_NAMES)
      style = FONT_STYLE_NAMES[part as keyof typeof FONT_STYLE_NAMES]
    else if (part in FONT_WEIGHT_NAMES)
      style = FONT_WEIGHT_NAMES[part as keyof typeof FONT_WEIGHT_NAMES]
    else if (part === 'normal')
      {}
    else
      name = part
  }
  return [
    size,
    FONT_NAMES[name as keyof typeof FONT_NAMES] ?? name,
    style,
    weight
  ] as [number, string, string, string]
}
