import { Canvas } from 'src/context2d'

export const settings = {
  RENDER_OPTIONS: {
    view: null,
    width: 800,
    height: 600,
    autoDensity: false,
    backgroundColor: 0x000000,
    backgroundAlpha: 1,
    clearBeforeRender: true,
    antialias: false,
    premultipliedAlpha: true,
    preserveDrawingBuffer: false,
    hello: false,
  },

  ADAPTER: {
    createCanvas: (width: number, height: number): Canvas => {
      return new Canvas(width, height)
    }
  }
}

export default settings
