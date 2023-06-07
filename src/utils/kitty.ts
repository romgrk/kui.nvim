/*
 * kitty.ts
 */

export function readKittyConfig(): Record<string, string | undefined> {
  const configDir = vim.fs.dirname(vim.fn.stdpath('config'))
  const configFile = `${configDir}/kitty/kitty.conf`
  const allLines = readLines(configFile)
  const lines = allLines.filter(line => line.trim() !== '' && !line.trim().startsWith('#'))
  const entries = lines.map(line => {
    const content = line.trim()
    const firstSpace = line.indexOf(' ')
    const key = content.slice(0, firstSpace)
    const value = content.slice(firstSpace).trim()
    return [key, value]
  })

  const config = Object.fromEntries(entries)

  const guifont = vim.api.nvim_get_option('guifont') as unknown as string
  if (guifont && guifont !== '') {
    const [fontName, ...params] = guifont.split(':')
    const h = params.find(p => p.startsWith('h'))

    config.font_family = fontName
    if (h)
      config.font_size = h.slice(1)
  }

  return config
}


function fileExists(path: string) {
  const [file] = io.open(path, 'rb')
  file?.close()
  return file !== null
}

function readLines(path: string) {
  if (!fileExists(path))
    return []
  const lines = []
  for (let [line] of io.lines(path)) {
    lines.push(line)
  }
  return lines
}
