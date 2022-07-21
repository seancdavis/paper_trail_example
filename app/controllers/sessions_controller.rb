# frozen_string_literal: true

class SessionsController < ApplicationController
  def new
    session[:redirect_to] = params[:redirect_to] if params[:redirect_to]
  end

  def create
    session[:user_id] = params[:session][:user_id]
    redirect_path = session[:redirect_to] || root_path
    session[:redirect_to] = nil
    redirect_to redirect_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to request.referrer || root_path
  end

  private

  def session_params
    params.require(:session).permit(:user_id)
  end
end
