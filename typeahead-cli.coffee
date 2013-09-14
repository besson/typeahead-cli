keypress = require "keypress"
search = require "./search"

keys = []
keypress(process.stdin)

process.stdin.on "keypress", (ch, key) ->
  if key && key.ctrl && key.name == "c"
    process.stdin.pause()

  if key && key.name == "backspace"
    keys.pop()
  else
    keys.push key.sequence

  word = keys.join ""

  console.log "\n$ #{word}"
  console.log "-------------------\n"

  search(word)

process.stdin.setRawMode true
process.stdin.resume

