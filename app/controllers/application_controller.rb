# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :user_signed_in?, :current_user

  private

  def authenticate_user!
    redirect_to new_session_path unless user_signed_in?
  end

  def user_signed_in?
    current_user.present?
  end

  def current_user
    @current_user ||= (User.find(session[:user_id]) if session[:user_id])
  end
end
