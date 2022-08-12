# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_channel, except: [:home]
  before_action :set_posts, only: %i[index edit]

  def index
    @post = Post.new
  end

  def edit
    @post = current_user.posts.where(id: params[:id], channel: @channel).first

    if @post.nil?
      redirect_to channel_posts_path(@channel),
                  alert: 'You can only edit your own posts from this channel.'
    end

    render :index
  end

  def create
    @post = Post.new(create_params)
    if @post.save
      redirect_to channel_posts_path(@channel), notice: 'Post was created successfully.'
    else
      set_posts
      render :index
    end
  end

  def update
    @post = current_user.posts.where(id: params[:id], channel: @channel).first

    if @post.nil?
      redirect_to channel_posts_path(@channel),
                  alert: 'You can only edit your own posts from this channel.'
    end

    if @post.update(post_params)
      redirect_to channel_posts_path(@channel), notice: 'Post was updated successfully.'
    else
      set_posts
      render :index
    end
  end

  def home
    redirect_to channel_posts_path(Channel.first)
  end

  private

  def post_params
    params.require(:post).permit(:body)
  end

  def create_params
    post_params.merge(channel: @channel, user: current_user)
  end

  def set_channel
    @channel = Channel.find(params[:channel_id])
  end

  def set_posts
    @posts = @channel.posts.includes(:user, :versions)
  end
end
