class SessionsController < ApplicationController
  def new
    render :new
  end


  # login
  def create
    @user = User.find_by_credentials(params[:user][:email], params[:user][:password])
    @user.session_token = User.generate_session_token

    if @user.save
      login(@user)
      redirect_to user_url(@user)
    else
      flash[:errors] = @user.errors.full_messages
    end
  end

  # logout
  def destroy
    logout
  end
end
