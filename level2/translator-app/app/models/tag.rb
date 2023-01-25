# frozen_string_literal: true

class Tag < ApplicationRecord
  has_many :messages, dependent: :destroy

  validates :name, presence: true
  validates :name, uniqueness: true
end
