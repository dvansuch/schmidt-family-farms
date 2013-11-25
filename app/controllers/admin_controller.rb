class AdminController < ApplicationController

	before_filter do 
    if session[:admin_id] != nil
      @admin = Admin.where(id: session[:admin_id]).first
    elsif @admin == nil
      flash[:error] = "You must be logged in to see that page."
      session[:original_route] = request.path_info
      redirect_to "/admin_login" and return
    end
  end

  def admin_index
    @orders = Order.all

  	render :admin_index
  end
end
