# frozen_string_literal: true

class PagesController < ApplicationController
  def home
    @view_options = { step_control: false, header: false }
  end
end
