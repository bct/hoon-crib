#!/usr/bin/env ruby

# credit to https://gist.github.com/verhovsky/cc0626a6e8aa7ad52c57b1167e839b1a
SYLLABLE_TO_SYMBOL = {
  "bar": "|",
  "bas": "\\",
  "buc": "$",
  "cab": "_",
  "cen": "%",
  "col": ":",
  "com": ",",
  "doq": "\"",
  "dot": ".",
  "fas": "/",
  "gal": "<",
  "gar": ">",
  "hax": "#",
  "hep": "-",
  "kel": "{",
  "ker": "}",
  "ket": "^",
  "lus": "+",
  "mic": ";",
  "pal": "(",
  "pam": "&",
  "par": ")",
  "pat": "@",
  "sel": "[",
  "ser": "]",
  "sig": "~",
  "soq": "'",
  "tar": "*",
  "tic": "`",
  "tis": "=",
  "wut": "?",
  "zap": "!"
}

SYMBOL_TO_SYLLABLE = SYLLABLE_TO_SYMBOL.invert

def syllable_to_symbol(syllable)
  SYLLABLE_TO_SYMBOL[syllable]
end

def symbol_to_syllable(symbol)
  SYMBOL_TO_SYLLABLE[symbol]
end

def puts_rune_documentation(rune, docs_by_syllables)
  syllables = rune&.each_char&.map {|x| symbol_to_syllable(x) }&.compact&.join

  documentation = docs_by_syllables[syllables]
  documentation ||= "found no documentation for rune #{rune}"

  puts documentation
end

