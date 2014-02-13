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
      @order.total = 0.0
      @order.is_paid = false

      if @existing_customer != nil
        @order.customer_id = @existing_customer.id 
      else 
        @customer = Customer.new
        @customer.first_name = params[:first_name].humanize
        @customer.last_name = params[:last_name].humanize
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
          @customer = Customer.where(id: @order.customer_id).first
          flash[:notice] = "Thank you for your order! Someone will contact you shortly regarding your order."
          Pony.mail(
            to:      "#{@customer.email}",
            subject: "Thank you For Ordering from Schmidt Family Farms",
            headers: { "Content-Type" => "text/html" },
            body:    "<h3>Thank you for your Order!</h3> <p>We provide only the best quality meat for our customers and we are happy you chose us. Someone will be contacting you shortly to finalize your order and payment information.</p>"
          )

          Pony.mail(
            to: "danielles.travels@gmail.com",
            subject: "New Order",
            headers: { "Content-Type" => "text/html" },
            body: "<h2>You have a new Order!</h2><p>#{@customer.first_name} #{@customer.last_name}
              <br>#{@customer.phone}
              <br>#{@customer.email}
              <br>#{@customer.address}
              <br>#{@customer.city}, #{@customer.state} #{@customer.zip}
              </p>
              <p> Order information 
              <table>
                <tr><center>Order Details</center></tr>
                <tr><th>Order Date</th><td>2014-02-11 16:36:32 UTC</td></tr>
                <tr><th>Whole Beef</th><td>#{@order.whole_beef}</td></tr>
                <tr><th>Half Beef</th><td>#{@order.half_beef}</td></tr>
                <tr><th>Quarter Beef</th><td>#{@order.qtr_beef}</td></tr>
                <tr><th>Whole Hog</th><td>#{@order.whole_hog}</td></tr>
                <tr><th>Half Hog</th><td>#{@order.half_hog}</td></tr>
                <tr><th>BBQ Hog</th><td>#{@order.bbq_hog}</td></tr>
                <tr><th>Chickens</th><td>#{@order.chickens}</td></tr>
                <tr><th>Lamb</th><td>#{@order.lamb}</td></tr>
                <tr><th>BBQ Pit</th><td>#{@order.bbq_pit}</td></tr>
                <tr><th>Comments</th><td>#{@order.comments}</td></tr>
                <tr><th>Total</th><td>#{@order.total}</td></tr>
                <tr><th>Paid?</th><td>#{@order.is_paid}</td></tr>
              </table>
              </p>"
          )
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