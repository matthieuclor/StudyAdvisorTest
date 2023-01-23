# frozen_string_literal: true

require './piou_translator/translator'

ENCODE_LANG = {
  'A' => 'piou',
  'B' => 'ioup',
  'C' => 'poup',
  'D' => 'iiou',
  'E' => 'ioui',
  'F' => 'pipp',
  'G' => 'ouip',
  'H' => 'poui',
  'I' => 'ppou',
  'J' => 'ipip',
  'K' => 'oupi',
  'L' => 'pouu',
  'M' => 'piiu',
  'N' => 'piui',
  'O' => 'uiui',
  'P' => 'opui',
  'Q' => 'pupu',
  'R' => 'iupi',
  'S' => 'piuu',
  'T' => 'piup',
  'U' => 'piop',
  'V' => 'ipou',
  'W' => 'oupu',
  'X' => 'uopu',
  'Y' => 'iupu',
  'Z' => 'iupp',
  '!' => 'iipu',
  ',' => 'iupo',
  '.' => 'ipuu',
  '?' => 'ppip'
}

class Encode < Translator
  attr_reader :result

  def initialize(text)
    super

    words = text.split

    @result = words.map do |word|
      word.chars.map { |l| ENCODE_LANG[l.upcase] }.join(' ')
    end.join('  ')
  end
end
