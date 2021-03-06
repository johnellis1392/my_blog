class UsersController < ApplicationController
  before_action :set_user, only: %i[show update destroy profile]

  # Example interpolated shell command:
  # %x{echo 'Hello, World!'}

  # GET /users
  def index
    skip_authorization
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    skip_authorization
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)
    authorize @user

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    authorize @user
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    authorize @user
    @user.destroy
  end

  def profile
    render json: @user
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def user_params
    params.require(:user).permit(:email, :password, :auth_token)
  end
end
