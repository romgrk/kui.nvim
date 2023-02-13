const fs = require('fs')
const path = require('path')
const walkdir = require('walkdir')

const rootDist = path.join(__dirname, '../dist')
const srcPrefix = `from 'src/`
const types1Prefix = `from 'types/`
const types2Prefix = `/// <reference types="./types`

const files = walkdir.sync(rootDist)

files.forEach(file => {
  if (fs.statSync(file).isDirectory())
    return

  const relativePath = file.replace(rootDist + '/', '')
  const levels = relativePath.split('/').length - 1

  let content = fs.readFileSync(file).toString()

  const srcReplacement = `from '${dotsForLevel(levels)}/`
  content = content.replaceAll(srcPrefix, srcReplacement)

  const types1Replacement = `from '${dotsForLevel(levels + 1)}/`
  content = content.replaceAll(types1Prefix, types1Replacement)

  const types2Replacement = `/// <reference types="${dotsForLevel(levels + 1)}/types`
  content = content.replaceAll(types2Prefix, types2Replacement)

  fs.writeFileSync(file, content)
})

function dotsForLevel(levels) {
  return Array.from({ length: levels }).map(() => '..').join('/') || '.'
}
