class PublicController < ApplicationController
  
  # before_filter except: ["login", "login_post", "root", "logout", "register", "about", "register_post"] do 
  #   if session[:scholar_id] != nil
  #     @scholar = Scholar.where(id: session[:scholar_id])
  #   elsif @scholar == nil
  #     flash[:error] = "You must be logged in to see that page."
  #     #session[:original_route] = request.path_info
  #     redirect_to "/login" and return
  #   end
  # end

  def root
    redirect_to "/index"
  end
  
  def index
    render :index
  end

  def about
    render :about
  end

  def products
    render :products
  end

  def beef
    render :beef
  end

  def pork
    render :pork
  end

  def chicken
    render :chicken
  end

  def lamb
    render :lamb
  end
  
  def services
    render :services
  end

  def order
    render :order
  end

  def order_post

  end

  def news
    render :news
  end

  def faq
    render :faq
  end

  def contact
    render :contact
  end

  def admin_login
    render :admin_login
  end

  # def admin_login_post
  #   @username = params[:username]
  #   #@scholar = Scholar.where(username: @username).first

  #   if @username = @scholar
  #     if @scholar.authenticate(params[:password]) != false
  #       session[:scholar_id] = @scholar.id
  #       if 
  #         @scholar.is_admin == false
  #         redirect_to "/reword"
  #       else
  #         redirect_to "/admin_controller"
  #       end
  #     else
  #       flash[:error] = "Incorrect password"
  #       render :scholar_login 
  #     end
  #   else
  #     flash[:error] = "Wrong username"
  #     render :scholar_login
  #   end
  # end

  # def logout
  #   session.clear
  #   redirect_to "/login"
  # end
end