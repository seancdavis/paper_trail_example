# frozen_string_literal: true

class ChannelsController < ApplicationController
  def index
    redirect_to root_path
  end

  def show
    redirect_to channel_messages_path(params[:id])
  end
end
