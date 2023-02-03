import * as cairo from 'kui.cairo.cairo'
import { Rectangle } from 'src/math'

export function setup() {
  print(new Rectangle(1, 0, 10, 10))
  const image = cairo.image_surface('argb32', 100, 100)
  const context = image.context()
  print(vim.inspect(context))
}
