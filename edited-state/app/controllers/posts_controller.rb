# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @posts = Post.all.order(created_at: :desc).limit(50).includes(:user)
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to @post
    else
      render :new
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post
    else
      render :edit
    end
  end

  # --- Atypical Rails Actions ---

  def restore
    version = PaperTrail::Version.find(params[:version])
    post = version.item
    post.update(body: version.changeset[:body][1])
    redirect_to post
  end

  def activity
    @versions = PaperTrail::Version.where(item_type: 'Post').order(created_at: :desc).limit(50).includes(:item, :user)
  end

  private

  def post_params
    params.require(:post).permit(:body)
  end
end
