# frozen_string_literal: true

class PagesController < ApplicationController
  def home
    @view_options = { header: false }
  end
end
