# frozen_string_literal: true

class StepsController < ApplicationController
  before_action :set_view_options

  def set_step
    session[:current_step] = params[:step]
    redirect_to step_path
  end

  def show
    current_step = (session[:current_step] || 0).to_i
    render step_views[current_step]
  end

  private

  def step_views
    %w[01-intro 02-test]
  end

  def set_view_options
    @view_options[:step_control] = false
  end
end
