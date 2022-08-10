# frozen_string_literal: true

class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_channel, except: [:home]

  def index
    @messages = @channel.messages.includes(:user)
    @message = Message.new
  end

  def edit
    @messages = @channel.messages.includes(:user)
    @message = current_user.messages.where(id: params[:id], channel: @channel).first

    if @message.nil?
      redirect_to channel_messages_path(@channel),
                  alert: 'You can only edit your own messages from this channel.'
    end

    render :index
  end

  def create
    @message = Message.new(create_params)
    if @message.save
      redirect_to channel_messages_path(@channel), notice: 'Message was created successfully.'
    else
      @messages = @channel.messages.includes(:user)
      render :index
    end
  end

  def update
    @message = current_user.messages.where(id: params[:id], channel: @channel).first

    if @message.nil?
      redirect_to channel_messages_path(@channel),
                  alert: 'You can only edit your own messages from this channel.'
    end

    if @message.update(message_params)
      redirect_to channel_messages_path(@channel), notice: 'Message was updated successfully.'
    else
      @messages = @channel.messages.includes(:user)
      render :index
    end
  end

  def home
    redirect_to channel_messages_path(Channel.first)
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end

  def create_params
    message_params.merge(channel: @channel, user: current_user)
  end

  def set_channel
    @channel = Channel.find(params[:channel_id])
  end
end
