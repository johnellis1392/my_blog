class Posts::CommentsController < ApplicationController
  before_action :set_post, only: %i[index show]
  before_action :set_comment, only: [:show]

  def index
    skip_authorization
    render json: @post.comments
  end

  def show
    skip_authorization
    render json: @comment
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_comment
    @comment = @post.comments.find(params[:id])
  end
end
