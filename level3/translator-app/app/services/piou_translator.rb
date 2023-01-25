# frozen_string_literal: true

require './app/services/piou_translator_src/encode'
require './app/services/piou_translator_src/decode'

class PiouTranslator
  ACTIONS = %w(encode decode).freeze
  attr_reader :text, :action

  def initialize(text = '', action = 'encode')
    @text, @action = text, action

    raise ArgumentError unless ACTIONS.include?(action)
    raise ArgumentError unless @text.is_a?(String)

    @action_template = Object.const_get(action.capitalize).new(@text)
  end

  def result
    @action_template.result
  end

  def success
    @action_template.success
  end
end
