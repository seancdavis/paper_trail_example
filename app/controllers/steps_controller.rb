# frozen_string_literal: true

class StepsController < ApplicationController
  before_action :set_view_options

  def set_step
    session[:current_step] = params[:step]
    redirect_to step_path(params[:step])
  end

  def show
    max_step = step_views.size - 1
    current_step = (params[:step] || session[:current_step] || 1).to_i
    return redirect_to step_path(step: 1) if current_step < 1
    return redirect_to step_path(step: max_step) if current_step > max_step

    render step_views[current_step]
  end

  private

  def step_views
    [nil, '01-intro', '02-create-post', '03-install-paper-trail', '04-verify-pt-setup']
  end

  def set_view_options
    @view_options[:step_control] = false
  end
end
