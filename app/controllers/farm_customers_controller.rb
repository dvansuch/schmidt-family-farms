class FarmCustomersController < ApplicationController
  before_action :set_farm_customer, only: [:show, :edit, :update, :destroy]

  before_filter do 
    if session[:admin_id] != nil
      @admin = Admin.where(id: session[:admin_id]).first
    elsif @adim == nil
      flash[:error] = "Admistrators must log in to see that page."
      session[:original_route] = request.path_info
      redirect_to "/admin_login" and return
    end
  end

  # GET /farm_customers
  # GET /farm_customers.json
  def index
    @customers = Customer.all
  end

  # GET /farm_customers/1
  # GET /farm_customers/1.json
  def show
  end

  # GET /farm_customers/new
  def new
    redirect_to "/order"
  end

  # GET /farm_customers/1/edit
  def edit
    @customer = Customer.find(params[:id])
  end

  # POST /farm_customers
  # POST /farm_customers.json
  def create
    @customer = Customer.new(farm_customer_params)

    respond_to do |format|
      if @farm_customer.save
        format.html { redirect_to @farm_customer, notice: 'Farm customer was successfully created.' }
        format.json { render action: 'show', status: :created, location: @farm_customer }
      else
        format.html { render action: 'new' }
        format.json { render json: @farm_customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /farm_customers/1
  # PATCH/PUT /farm_customers/1.json
  def update
    @customer = Customer.find(params[:id])

    respond_to do |format|
      if @customer.update(farm_customer_params)
        format.html { redirect_to edit_farm_customer_path, notice: 'Farm customer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /farm_customers/1
  # DELETE /farm_customers/1.json
  def destroy
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to farm_customers_path }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_farm_customer
      @customer = Customer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def farm_customer_params
      params[:customer].permit(:first_name, :last_name, :email, :phone, :address, :city, :state, :zip, :updated_at)
    end
end
