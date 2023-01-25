# frozen_string_literal: true

FactoryBot.define do
  factory :tag do
    name { %w(Urgent Secret Rigolo).sample }
  end
end
