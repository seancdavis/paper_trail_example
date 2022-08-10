# frozen_string_literal: true

class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_channel, except: [:home]

  def index
    @messages = @channel.messages.includes(:user)
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to messages_path(@channel), notice: 'Message was successfully created.'
    else
      @messages = @channel.messages.includes(:user)
      render :index
    end
  end

  def home
    redirect_to messages_path(Channel.first)
  end

  private

  def message_params
    params.require(:message).permit(:body).merge(channel: @channel, user: current_user)
  end

  def set_channel
    @channel = Channel.find(params[:channel_id])
  end
end
