class SessionsController < ApplicationController
  skip_before_filter :authorize

  def new

  end

  def create
     if user = User.authenticate(params[:email],params[:password])
      session[:user_id] = user.id
      if user.email = "admin@seenchild.org"
        redirect_to users_path
      else
        redirect_to report_path
      end
    else
      redirect_to login_url, :alert => "Invalid username or password"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, :notice =>"Logged out"
  end

end
