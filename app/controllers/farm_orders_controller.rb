class FarmOrdersController < ApplicationController
  before_action :set_farm_order, only: [:show, :edit, :update, :destroy]

  before_filter do 
    if session[:admin_id] != nil
      @admin = Admin.where(id: session[:admin_id]).first
    elsif @adim == nil
      flash[:error] = "Admistrators must log in to see that page."
      session[:original_route] = request.path_info
      redirect_to "/admin_login" and return
    end
  end

  # GET /farm_orders
  # GET /farm_orders.json
  def index
    @orders = Order.all(:order => "created_at desc")
  end

  # GET /farm_orders/1
  # GET /farm_orders/1.json
  def show
    @order = Order.find(params[:id])
  end

  # def receipt
  #   @order = Order.find(params[:id])
  #   if param[:commit] == 'Send A Receipt'
  #     Pony.mail(
  #       to:      "danielles.travels@gmail.com",
  #       subject: "Schmidt Family Farms Receipt - Thank You",
  #       headers: { "Content-Type" => "text/html" },
  #       body:    "<h4>Customer Information:</h4>
  #             <address>
  #               #{@order.customer.first_name}
  #               #{@order.customer.last_name}
  #               <br>
  #               #{@order.customer.address}
  #               <br>
  #               #{@order.customer.city}
  #               #{@order.customer.state}
  #               #{@order.customer.zip}
  #             </address>
  #             <address>
  #               <strong>Email:</strong>
  #               <br>
  #               #{@order.customer.email}
  #               <br>
  #               <strong>Phone Number:</strong>
  #               <br>
  #               #{@order.customer.phone}
  #               <br>
  #             </address>
  #             <table>
  #               <tr><center>Your Order Details</center></tr>
  #               <tr><th>Order Date</th><td>2014-02-11 16:36:32 UTC</td></tr>
  #               <tr><th>Whole Beef</th><td>#{@order.whole_beef}</td></tr>
  #               <tr><th>Half Beef</th><td>#{@order.half_beef}</td></tr>
  #               <tr><th>Quarter Beef</th><td>#{@order.qtr_beef}</td></tr>
  #               <tr><th>Whole Hog</th><td>#{@order.whole_hog}</td></tr>
  #               <tr><th>Half Hog</th><td>#{@order.half_hog}</td></tr>
  #               <tr><th>BBQ Hog</th><td>#{@order.bbq_hog}</td></tr>
  #               <tr><th>Chickens</th><td>#{@order.chickens}</td></tr>
  #               <tr><th>Lamb</th><td>#{@order.lamb}</td></tr>
  #               <tr><th>BBQ Pit</th><td>#{@order.bbq_pit}</td></tr>
  #               <tr><th>Comments</th><td>#{@order.comments}</td></tr>
  #               <tr><th>Total</th><td>#{@order.total}</td></tr>
  #               <tr><th>Paid?</th><td>#{@order.is_paid}</td></tr>
  #             </table>
  #             <p>If any of your contact information is out of date please respond to this email letting us know of any changes. If you have questions about your order we are happy to answer any questions you may have.</p>
  #             <p>Thank your for ordering from Schmidt Family Farms! We appreciate your business and look forward to doing business again in the future!</p>"
  #     )
  #     flash[:notice] = "A Receipt was emailed to #{@order.customer.email}."
  #     redirect_to '/farm_order'  
  #   end
  # end

  # GET /farm_orders/new
  def new
    redirect_to "/order"
  end

  # GET /farm_orders/1/edit
  def edit
    @order = Order.find(params[:id])
  end

  # POST /farm_orders
  # POST /farm_orders.json
  def create
    @order = Order.new(farm_order_params)
    respond_to do |format|
      if @farm_order.save
        format.html { redirect_to @farm_order, notice: 'Farm order was successfully created.' }
        format.json { render action: 'show', status: :created, location: @farm_order }
      else
        format.html { render action: 'new' }
        format.json { render json: @farm_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /farm_orders/1
  # PATCH/PUT /farm_orders/1.json
  def update
    @order = Order.find(params[:id])
    respond_to do |format|
      if @order.update(farm_order_params)
        format.html { redirect_to edit_farm_order_path, notice: 'Farm order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /farm_orders/1
  # DELETE /farm_orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to farm_orders_path }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_farm_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.

    def farm_order_params
      params[:order].permit(:whole_beef, :half_beef, :qtr_beef, :whole_hog, :half_hog, :bbq_hog, :chickens, :lamb, :bbq_pit, :comments, :is_paid, :total, :updated_at)
    end
end
