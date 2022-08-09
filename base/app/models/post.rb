# frozen_string_literal: true

class Post < ApplicationRecord
  has_paper_trail

  validates :body, presence: true, uniqueness: true, length: { maximum: 280 }
  belongs_to :user
end
