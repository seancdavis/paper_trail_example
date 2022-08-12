# frozen_string_literal: true

class Post < ApplicationRecord
  has_paper_trail

  belongs_to :user

  validates :title, presence: true
  validates :body, presence: true

  default_scope { order(created_at: :asc) }
end
