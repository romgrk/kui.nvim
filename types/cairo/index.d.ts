declare module 'kui.cairo.cairo' {
  type ImageType = 'argb32' | 'rgb24'

  class ImageSurface {
    flush(): void;
    context(): Context;
  }

  /** @noSelf */
  function image_surface(type: ImageType, width: number, height: number): ImageSurface;


  class Context {
    save(): void;
    restore(): void;

    rgba(r: number, g: number, b: number, a: number): void;

    fill(): void;
    stroke(): void;
    rectangle(x: number, y: number, width: number, height: number): void;

    // transformations
    get_matrix(): Matrix;
    set_matrix(m: Matrix): void;
    transform(m: Matrix): this;
    translate(x: number, y: number): this;
    scale(x: number, y: number): this;
    rotate(rads: number): this;
  }


  class Matrix {}

  /** @noSelf */
  function matrix(a?: number, b?: number, c?: number, d?: number, e?: number, f?: number): Matrix;


}
