import EventEmitter from 'src/eventemitter3'

type Events = 'colorscheme'
type Fn = (...args: any[]) => unknown

class Editor extends EventEmitter<Events> {
  constructor() {
    super()

    vim.api.nvim_create_autocmd(['ColorScheme'], {
      pattern: ['*'],
      callback: () => this.emit('colorscheme'),
    })
  }

  getHighlight(name: string) {
    if (vim.fn.hlexists(name) === 0)
      return {}
    return vim.api.nvim_get_hl_by_name(name, true)
  }

  onColorSchemeChange(fn: Fn) {
    this.on('colorscheme', fn)
    return () => this.off('colorscheme', fn)
  }
}

export const editor = new Editor()

export default editor
