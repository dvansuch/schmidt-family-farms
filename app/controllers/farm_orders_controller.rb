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
      params[:order].permit(:whole_beef, :half_beef, :qtr_beef, :whole_hog, :half_hog, :bbq_hog, :chickens, :lamb, :bbq_pit, :comments, :is_paid, :updated_at)
    end
end
