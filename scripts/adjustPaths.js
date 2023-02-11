const fs = require('fs')
const path = require('path')
const walkdir = require('walkdir')

const rootDist = path.join(__dirname, '../dist')
const prefix = '\'src/'

const files = walkdir.sync(rootDist)

files.forEach(file => {
  if (fs.statSync(file).isDirectory())
    return

  const content = fs.readFileSync(file).toString()
  const relativePath = file.replace(rootDist + '/', '')
  const levels = relativePath.split('/').length - 1
  const replacementPath = Array.from({ length: levels }).map(() => '..').join('/') || '.'
  const replacement = `'${replacementPath}/`

  fs.writeFileSync(file, content.replaceAll(prefix, replacement))
})
