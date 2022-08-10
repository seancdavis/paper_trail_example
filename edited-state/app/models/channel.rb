# frozen_string_literal: true

class Channel < ApplicationRecord
  validates :title, presence: true,
                    uniqueness: true,
                    length: { maximum: 100 },
                    format: {
                      with: /\A[a-zA-Z0-9\-_]+\z/,
                      message: 'only allows letters, numbers, dashes, and underscores'
                    }

  has_many :messages

  default_scope { order(:title) }
end
