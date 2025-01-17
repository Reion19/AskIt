class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      sign_in(user)
      flash[:success] = "Welcome back, #{current_user.name_or_email}"
      redirect_to root_path
    else
      flash[:warning] = 'Incorrect email or password!'
      redirect_to new_session_path
    end
  end

  def destroy
  end
end
