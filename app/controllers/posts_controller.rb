class PostsController < ApplicationController
  before_action :set_post, only: %i[show update destroy]

  # GET /posts
  def index
    skip_authorization
    @posts = Post.all

    render json: @posts
  end

  # GET /posts/1
  def show
    # Skip pundit authorization
    skip_authorization

    # Skip policy scoping
    # skip_policy_scope

    # Example using Pundit scope to retrieve restricted list of posts:
    # @posts = policy_scope(Post)

    render json: @post
  end

  # POST /posts
  def create
    @post = Post.new(post_params)
    authorize @post

    if @post.save
      render json: @post, status: :created, location: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/1
  def update
    # Authorization with Pundit
    authorize @post
    # authorize @post, :update? # Authorize specific method
    # authorize Post # In case you don't have a specific class instance

    if @post.update(post_params)
      render json: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1
  def destroy
    authorize @post
    @post.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def post_params
    params.require(:post).permit(:title, :body, :user_id)
  end
end
