# frozen_string_literal: true

class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_channel, except: [:home]

  def index
    @messages = @channel.messages.includes(:user)
    @message = Message.new
  end

  def home
    redirect_to messages_path(Channel.first)
  end

  private

  def set_channel
    @channel = Channel.find(params[:channel_id])
  end
end
