class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = 'you have logged in'
      redirect_to user_path(user)
    else
      flash.now[:danger] = 'We were not able to log you on with the details provided'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'you have been lo=geed out'
    redirect_to login_path
  end
end
