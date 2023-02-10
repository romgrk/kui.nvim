import './setup'
import './typedarray'
import './graphics'

import * as h from 'kui.legacy'
import * as cairo from 'kui.cairo.cairo'
import { Color } from 'src/color'
import { Rectangle } from 'src/math'
import { Renderer } from 'src/core'
import { Container } from 'src/display'
import { Graphics } from 'src/graphics'
import { Text } from 'src/text'

export function setup() {
  // print(new Rectangle(1, 0, 10, 10))
  // const image = cairo.image_surface('argb32', 100, 100)
  // const context = image.context()

  const renderer = new Renderer({
    width: 150,
    height: 80,
  })
  const stage = new Container()
  const content = stage.addChild(new Graphics())
  content.x = 10
  content.y = 10
  content.beginFill(0x599eff)
  content.drawRoundedRect(0, 0, 50, 10, 5)
  content.endFill()

  const text = stage.addChild(new Text('Hello world', {
    fontSize: 12,
    fill: 0xffffff,
  }))
  text.x = 10
  text.y = 20

  renderer.render(stage)

  h.setup()
  h.add_image(
    renderer.canvasContext.rootContext.surface,
    { buffer: 0, row: 0, col: 0 }
  )

  // renderer.canvasContext.rootContext
  // renderer.canvasContext.rootContext
  // print(vim.inspect(renderer))
}

// core.index
// core.Renderer
// canvas-renderer.index
// canvas-renderer.CanvasContextSystem
// core.index
