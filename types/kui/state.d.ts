declare module 'kui.legacy.state' {
  export function update_dimensions(): void
  export const dimensions: {
    screen_cells: {
      width: number,
      height: number,
    },
    screen_pixels: {
      width: number,
      height: number,
    },
    cell_pixels: {
      width: number,
      height: number,
    },
  }
}
