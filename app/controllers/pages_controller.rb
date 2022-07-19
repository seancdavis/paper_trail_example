# frozen_string_literal: true

class PagesController < ApplicationController
  def home; end

  def show
    render params[:slug]
  end
end
