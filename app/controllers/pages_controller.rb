# frozen_string_literal: true

class PagesController < ApplicationController
  layout 'basic_page', only: [:show]

  def home
    @view_options[:header] = false
  end

  def show
    render params[:slug]
  end
end
