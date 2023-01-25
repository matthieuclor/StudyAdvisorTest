# frozen_string_literal: true

FactoryBot.define do
  factory :message do
    quote = Faker::Movies::StarWars.quote
    piou_translator = PiouTranslator.new(quote)

    french_content { quote }
    piou_content { piou_translator.result }

    association :user
    association :tag
  end
end
