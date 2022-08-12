# frozen_string_literal: true

class Channel < ApplicationRecord
  validates :title, presence: true,
                    uniqueness: true,
                    length: { maximum: 100 },
                    format: {
                      with: /\A[a-zA-Z0-9\-_]+\z/,
                      post: 'only allows letters, numbers, dashes, and underscores'
                    }

  has_many :posts

  default_scope { order(:title) }
end
