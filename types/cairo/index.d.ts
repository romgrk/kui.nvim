declare module 'kui.cairo.cairo' {
  type ImageType = 'argb32' | 'rgb24'

  class Context {
  }

  class ImageSurface {
    context(): Context;
  }

  /** @noSelf */
  function image_surface(type: ImageType, width: number, height: number): ImageSurface;
}
