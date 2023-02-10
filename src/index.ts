import './setup'
import './typedarray'
import './graphics'

import * as h from 'kui.legacy'
import { Renderer } from 'src/core'
import { Container } from 'src/display'
import { Graphics } from 'src/graphics'
import { Text } from 'src/text'

export function setup() {
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
}
