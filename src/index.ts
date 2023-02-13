import './setup'
import './typedarray'
import './graphics'
import './canvas-renderer'

import { settings } from 'src/settings'
import { editor } from 'src/editor'
import { readKittyConfig } from 'src/utils'
import { TextStyle } from 'src/text'

import { Renderer } from 'src/core'
import { Container } from 'src/display'
import { Graphics } from 'src/graphics'
import { Text } from 'src/text'
import { Input } from 'src/input'
import { ticker } from 'src/animate'

export * from 'src/animate'
export * from 'src/editor'
export * from 'src/display'
export * from 'src/graphics'
export * from 'src/input'
export * from 'src/math'
export * from 'src/text'

export function setup() {
  const config = readKittyConfig()
  settings.DEFAULT_FONT_NAME = config.font_family ?? settings.DEFAULT_FONT_NAME
  settings.DEFAULT_FONT_SIZE = config.font_size ? parseFloat(config.font_size) * 1.33 : settings.DEFAULT_FONT_SIZE
  settings.FONT_NAMES.monospace = settings.DEFAULT_FONT_NAME
  TextStyle.defaultStyle.fontSize = settings.DEFAULT_FONT_SIZE

  // demo()
}

export function demo() {
  const cellPixels = settings.DIMENSIONS.cell_pixels
  const cw = cellPixels.width
  const ch = cellPixels.height

  const width  = 20 * cw
  const height = 8 * ch
  const renderer = new Renderer({ col: 10, row: 5, width, height })
  const stage = new Container()

  const container = stage.addChild(new Graphics())
  container.x = 0
  container.y = 0
  container.beginFill(0x3e4556)
  container.drawRoundedRect(0, 0, width, height, 20)
  container.endFill()
  container.lineStyle(2, 0x20232C, 1)
  container.drawRoundedRect(0, 0, width, height, 20)

  const input = stage.addChild(new Input({
    padding: 5,
    width: width - 4 * cw,
    backgroundColor: 0x4F586D,
    borderColor: 0xdddddd,
    borderWidth: 1,
    borderRadius: 5,
  }))
  input.x = 2 * cw
  input.y = 1 * ch

  const underline = input.addChild(new Graphics())
  underline.x = 5
  underline.y = input.height - 3

  const text = stage.addChild(new Text('Hello world',
    { fill: editor.getHighlight('normal').foreground ?? 0 }))
  text.x = 2 * cw

  const dots = stage.addChild(new Graphics())
  dots.y = container.height - 2 * cw
  dots.beginFill(0x599eff)
  dots.drawCircle(3 * cw,         0, 10)
  dots.drawCircle(width / 2,      0, 10)
  dots.drawCircle(width - 3 * cw, 0, 10)

  ticker((current: number) => {
    const width = 50 + 50 * Math.abs(Math.sin(current / 1000))
    underline.clear()
    underline.beginFill(0x599eff)
    underline.drawRoundedRect(0, 0, width, 2, 2)
    underline.endFill()

    text.y = 55 + 15 * Math.sin(current / 1000)
    renderer.render(stage)
  })
}
