class ApplicationController < ActionController::Base
  before_filter :authorize
  protect_from_forgery

  layout :layout_by_resource

  protected
    def authorize
      unless User.find_by_id(session[:user_id])
        redirect_to login_url, :notice => "Please log in"
      end
    end

    def layout_by_resource
      if @child_crud
        "layout_for_crud"
      else
        "application"
      end
    end
end
