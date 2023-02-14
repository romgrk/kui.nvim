import * as state from 'kui.legacy.state'
export * from 'kui.legacy.state'
export default state

vim.api.nvim_create_autocmd('VimResized', {
  pattern: ['*'],
  callback: () => {
    state.update_dimensions()
  },
})
