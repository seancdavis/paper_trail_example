class SessionsController < ApplicationController
  def new; end

  def create
    session[:user_id] = params[:session][:user_id]
    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  private

  def session_params
    params.require(:session).permit(:user_id)
  end
end
