import { Context2D, Canvas } from 'src/context2d'

export const settings = {
  RESOLUTION: 1,
  ROUND_PIXELS: true,

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
    getCanvasRenderingContext2D: () => Context2D,
    createCanvas: (width: number, height: number): Canvas => {
      return new Canvas(width, height)
    },
  }
}

export default settings
