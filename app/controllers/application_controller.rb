class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

# methods in the application controler are available to all controllers but not autoamticaly to all views.
helper_method :current_user, :logged_in? # this makes these available to our views

def current_user
  @current_user ||= User.find(session[:user_id]) if session[:user_id] #This is saying, set @_current_user to {SOMETHING} if it is nil
end

def logged_in?
  !!current_user  #the !! converts to true or false if object exists
end

def require_user
    if !logged_in?
      flash[:danger] = "Opps your not logged in!!!"
    redirect_to login_path
  end
end




end
