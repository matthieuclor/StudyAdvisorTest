# frozen_string_literal: true

require './piou_translator/translator'

DECODE_LANG = {
  'piou' => 'A',
  'ioup' => 'B',
  'poup' => 'C',
  'iiou' => 'D',
  'ioui' => 'E',
  'pipp' => 'F',
  'ouip' => 'G',
  'poui' => 'H',
  'ppou' => 'I',
  'ipip' => 'J',
  'oupi' => 'K',
  'pouu' => 'L',
  'piiu' => 'M',
  'piui' => 'N',
  'uiui' => 'O',
  'opui' => 'P',
  'pupu' => 'Q',
  'iupi' => 'R',
  'piuu' => 'S',
  'piup' => 'T',
  'piop' => 'U',
  'ipou' => 'V',
  'oupu' => 'W',
  'uopu' => 'X',
  'iupu' => 'Y',
  'iupp' => 'Z',
  'iipu' => '!',
  'iupo' => ',',
  'ipuu' => '.',
  'ppip' => '?'
}

class Decode < Translator
  attr_reader :result

  def initialize(text)
    words = text.split(/ /)

    @result = words.map do |word|
      word == '' ? ' ' : DECODE_LANG[word]
    end.join
  end
end
