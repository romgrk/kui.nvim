import * as cairo from 'kui.cairo.cairo'
import { Color, ColorSource } from 'src/color'

type DOMMatrix = {
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

export class Context2D {
  width: number
  height: number

  surface: cairo.ImageSurface
  context: cairo.Context

  private _globalCompositeOperation: CompositeOperation
  private _globalAlpha: number
  private _fillColor: Color
  private _strokeColor: Color

  constructor(width: number, height: number) {
    this.width = width
    this.height = height

    this.surface = cairo.image_surface('argb32', width, height)
    this.context = this.surface.context()

    this._globalCompositeOperation = 'source-over'
    this._globalAlpha = 1.0
    this._fillColor = new Color(0x000000)
    this._strokeColor = new Color(0x000000)
  }

  // canvas
  // direction

  get globalCompositeOperation() { return this._globalCompositeOperation }
  set globalCompositeOperation(value: CompositeOperation) { this._globalCompositeOperation = value }

  get globalAlpha() { return this._globalAlpha }
  set globalAlpha(value: number) { this._globalAlpha = value }

  get fillStyle() { return this._fillColor }
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

  // filter
  // font
  // fontKerning
  // fontStretch
  // fontVariantCaps
  // globalCompositeOperation
  // imageSmoothingEnabled
  // imageSmoothingQuality
  // letterSpacing
  // lineCap
  // lineDashOffset
  // lineJoin
  // lineWidth
  // miterLimit
  // shadowBlur
  // shadowColor
  // shadowOffsetX
  // shadowOffsetY
  // textAlign
  // textBaseline
  // textRendering
  // wordSpacing

  // arc()
  // arcTo()
  // beginPath()
  // bezierCurveTo()
  // clearRect()
  // clip()
  // closePath()
  // createConicGradient()
  // createImageData()
  // createLinearGradient()
  // createPattern()
  // createRadialGradient()
  // drawFocusIfNeeded()
  // drawImage()
  // ellipse()
  // fill()
  // fillText()
  // getContextAttributes()
  // getImageData()
  // getLineDash()
  // isContextLost()
  // isPointInPath()
  // isPointInStroke()
  // lineTo()
  // measureText()
  // moveTo()
  // putImageData()
  // quadraticCurveTo()
  // rect()
  // reset()
  // resetTransform()
  // roundRect()
  // scrollPathIntoView()
  // setLineDash()
  // stroke()
  // strokeText()

  save() { this.context.save() }
  restore() { this.context.restore() }

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

  getContext(_name: '2d') {
    return this.context
  }
}
