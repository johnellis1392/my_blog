class Users::PostsController < ApplicationController
  before_action :set_user, only: %i[index show]
  before_action :set_post, only: [:show]

  def index
    skip_authorization
    render json: @user.posts
  end

  def show
    skip_authorization
    render json: @post
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_post
    @post = @user.posts.find(params[:id])
  end
end
