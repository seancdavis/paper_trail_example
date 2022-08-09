# frozen_string_literal: true

class Message < ApplicationRecord
  has_paper_trail

  belongs_to :user
  belongs_to :channel

  validates :body, presence: true
end
