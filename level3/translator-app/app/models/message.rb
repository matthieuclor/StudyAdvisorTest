# frozen_string_literal: true

class Message < ApplicationRecord
  CONTENT_MAX = 500

  belongs_to :user
  belongs_to :tag, optional: true

  validates :user, :french_content, :piou_content, presence: true
  validates :french_content, length: { minimum: 1, maximum: CONTENT_MAX }
  validates :piou_content, length: { minimum: 1, maximum: CONTENT_MAX }

  before_validation :trad_content

  private

  def trad_content
    return unless user.present?
    text = user.fr? ? french_content : piou_content
    action = user.fr? ? 'encode' : 'decode'
    attibute = user.fr? ? 'piou_content' : 'french_content'
    piou_translator = ::PiouTranslator.new(text, action)
    send("#{attibute}=", piou_translator.result)
  end
end
