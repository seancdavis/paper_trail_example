# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_paper_trail_whodunnit

  private

  def set_default_view_options
    @view_options = { header: true }
  end
end
