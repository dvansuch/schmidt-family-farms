class PublicController < ApplicationController
  
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
    @email = params[:email]
    @existing_customer = Customer.where(email: @email).first
    if params[:commit] == "Submit Order"
      @order = Order.new
      @order.whole_beef = params[:whole_beef]
      @order.half_beef = params[:half_beef]
      @order.qtr_beef = params[:qtr_beef]
      @order.bbq_hog = params[:bbq_hog]
      @order.half_hog = params[:half_hog]
      @order.whole_hog = params[:whole_hog]
      @order.chickens = params[:chickens]
      @order.lamb = params[:lamb]
      @order.bbq_pit = params[:bbq_pit]
      @order.comments = params[:comments]
      @order.is_paid = false

      if @existing_customer != nil
        @order.customer_id = @existing_customer.id 
      else 
        @customer = Customer.new
        @customer.first_name = params[:first_name].humanize
        @customer.last_name = params[:last_name]
        @customer.email = params[:email].downcase
        @customer.phone = params[:phone]
        @customer.address = params[:address]
        @customer.city = params[:city].humanize
        @customer.state = params[:state]
        @customer.zip = params[:zip]

        @customer.save
        if @customer.save == false
          flash[:error] = "Your Order Failed to Process. Please address the errors below and resubmit your Order!"
          render :order and return
        else
          @order.customer_id = @customer.id
        end
      end
      
      if @order.customer_id != nil
        @order.save
        if @order.save == true
          flash[:notice] = "Thank you for your order! Someone will contact you shortly regarding your order."
          redirect_to '/order'
        else
          flash[:error] = "Your Order Failed to Process. Please address the errors below and resubmit your Order!"
          render :order and return
        end
      else
        flash[:error] = "Your Order Failed to Process. Please address the errors below and resubmit your Order!"
      end
    end
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

  def admin_login_post
    @email = params[:email]
    @admin = Admin.where(email: @email).first

    if @admin != nil
      if @admin.email = @email
        if @admin.authenticate(params[:password]) != false
          session[:admin_id] = @admin.id
          redirect_to "/admin_index"
        else
          flash[:error] = "Incorrect password"
          render :admin_login 
        end
      end
    else
      flash[:error] = "Wrong username or email"
      render :admin_login and return
    end
  end

  def admin_logout
    session.clear
    flash[:error] = "You are now signed out"
    redirect_to "/admin_login"
  end

  def test
    render :test
  end
end