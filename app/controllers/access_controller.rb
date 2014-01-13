class AccessController < ApplicationController
  layout 'login'

  def index
  end

  def login_access
  end

  def attempt_login
    if params[:email].present? && params[:password].present?
      found_user = User.where(:email => params[:email]).first
      if found_user
        authorized_user = found_user.authenticate(params[:password])
      end
    end
    if authorized_user
      # mark user as logged in
      session[:user_id] = authorized_user.id
      set_access_params
      flash[:notice] = "#{authorized_user.first_name}, you are now logged in "
      redirect_to controller: 'users', action: 'index'
    else
      flash[:error] = "Invalid username/password combination."
      redirect_to controller: 'users', action: 'index'
    end
  end

  def logout
    # mark user as logged out
    if session[:user_session] != nil
      if session[:user_session].is_active
        if session[:timed_out]
          flash[:error] = "You being logged out"
        else
          flash[:notice] = "Logged out successfully"
        end
        session[:user_session].is_active = false
      end
    end
    session[:user_id] = nil
    session[:last_seen] = nil
    session[:user_session] = nil
    if session[:timed_out] = true
      redirect_to controller: 'access', action: 'login_access'
    else
      redirect_to controller: 'users', action: 'index'
    end
  end
end
