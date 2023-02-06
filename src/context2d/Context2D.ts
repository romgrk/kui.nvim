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
  // fillText()
  // getContextAttributes()
  // getImageData()
  // getLineDash()
  // isContextLost()
  // isPointInPath()
  // isPointInStroke()
  lineTo(x: number, y: number) { this.context.line_to(x, y) }
  // measureText()
  moveTo(x: number, y: number) { this.context.move_to(x, y) }
  // putImageData()
  quadraticCurveTo(x1: number, y1: number, x2: number, y2: number) { this.context.quad_curve_to(x1, y1, x2, y2) }
  // reset()
  // resetTransform()
  roundRect(x: number, y: number, width: number, height: number, radius: number) {
    this.context.rounded_rectangle(x, y, width, height, radius)
  }
  // scrollPathIntoView()
  // setLineDash()
  stroke() { this.context.stroke() }
  // strokeText()

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
