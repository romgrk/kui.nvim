
declare module 'kui.legacy.image' {
  export class Image {
    /** @noSelf */
    static new(data: any, opts: { buffer?: number, row: number, col: number }): Image;

    did_cancel: boolean

    transmit(fn?: Function): void;
    display(opts?: { z_index?: number }): void;
    delete(opts?: { free?: boolean }): void;
  }
}
