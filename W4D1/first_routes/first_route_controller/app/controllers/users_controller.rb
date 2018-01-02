class UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users
  end

  def create
    user = User.new(user_params)
    # replace the `user_attributes_here` with the actual attribute keys
    if user.save
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    user = User.find_by(id: params[:id])

    if user
      render json: user
    else
      render plain: 'User could not be found', status: 404
    end
  end

  def update
    user = User.find_by(id: params[:id])

    if user
      if user.update(user_params)
        redirect_to users_url
      else
        render json: user.errors.full_messages, status: :unprocessable_entity
      end
    else
      render plain: 'No user found', status: 404
    end
  end

  def destroy
    user = User.find_by(id: params[:id])

    if user
      user.destroy
      redirect_to users_url
    else
      render plain: 'User does not exist', status: 404
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
