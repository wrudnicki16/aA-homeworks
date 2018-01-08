class UsersController < ApplicationController
  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in_user(@user)
      render plain: "Content here" # needs to be changed - why?
    else
      flash[:errors] = @user.errors.full_messages
      render :new # if it didn't work, try again.
    end
  end

  private

  def user_params
    params.require(:user).permit([:email, :password])
  end
end
