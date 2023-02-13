import * as state from 'kui.legacy.state'
import type { Canvas } from 'src/context2d'

export const settings = {
  DEFAULT_FONT_NAME: 'monospace',
  DEFAULT_FONT_SIZE: 12,
  FONT_NAMES: {
    'serif':      'Arial',
    'sans-serif': 'Arial',
    'monospace':  'Arial',
  },

  DIMENSIONS: state.dimensions,

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
    getCanvasRenderingContext2D: () => require('src/context2d').Context2D,
    createCanvas: (width: number, height: number): Canvas => {
      const Canvas = require('src/context2d').Canvas
      return new Canvas(width, height)
    },
  }
}

export default settings
