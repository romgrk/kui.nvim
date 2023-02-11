import './setup'
import './typedarray'
import './graphics'
import './canvas-renderer'

import { Renderer } from 'src/core'
import { Container } from 'src/display'
import { Graphics } from 'src/graphics'
import { Text } from 'src/text'
import { ticker } from 'src/animate'

export function setup() {

  const width = 150
  const height = 80

  const renderer = new Renderer({
    col: 10,
    row: 5,
    width,
    height,
  })
  const stage = new Container()

  const container = stage.addChild(new Graphics())
  container.x = 0
  container.y = 0
  container.lineStyle(2, 0x20232C, 1)
  container.beginFill(0x3e4556)
  container.drawRoundedRect(0, 0, width, height, 20)
  container.endFill()

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

  ticker((current: number) => {
    text.y = 20 + 20 * Math.sin(current / 1000)
    renderer.render(stage)
  })
}
