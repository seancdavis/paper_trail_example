# frozen_string_literal: true

class StepsController < ApplicationController
  def set_current_step
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
end
