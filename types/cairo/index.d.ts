declare module 'kui.cairo.cairo' {
  type ImageType = 'argb32' | 'rgb24'

  class ImageSurface {
    flush(): void;
    context(): Context;
  }

  class Pattern {}

  /** @noSelf */
  function image_surface(type: ImageType, width: number, height: number): ImageSurface;


  class Context {
    save(): void;
    restore(): void;

    rgba(r: number, g: number, b: number, a: number): void;

    get_line_width(): number;
    set_line_width(value: number): void;

    new_path(): void;
    new_sub_path(): void;
    move_to(x: number, y: number): void;
    line_to(x: number, y: number): void;
    curve_to(x1: number, y1: number, x2: number, y2: number, x3: number, y3: number): void;
    arc(xc: number, yc: number, radius: number, angle1: number, angle2: number): void;
    arc_negative(xc: number, yc: number, radius: number, angle1: number, angle2: number): void;
    rel_move_to(x: number, y: number): void;
    rel_line_to(x: number, y: number): void;
    rel_curve_to(x1: number, y1: number, x2: number, y2: number, x3: number, y3: number): void;
    close_path(): void;
    path_extents(): [number, number, number, number];
    mask(pattern: Pattern): void;
    mask_surface(surface: ImageSurface, x: number, y: number): void;

    rectangle(x: number, y: number, width: number, height: number): void;

    fill(): void;
    fill_preserve(): void;
    stroke(): void;
    stroke_preserve(): void;

    paint(): void;
    paint_with_alpha(alpha: number): void;

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
