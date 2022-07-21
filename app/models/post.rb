# frozen_string_literal: true

class Post < ApplicationRecord
  validates :body, presence: true, uniqueness: true, length: { maximum: 280 }
  belongs_to :user
end
