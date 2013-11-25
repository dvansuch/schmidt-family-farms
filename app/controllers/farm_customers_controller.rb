class FarmCustomersController < ApplicationController
  before_action :set_farm_customer, only: [:show, :edit, :update, :destroy]

  # GET /farm_customers
  # GET /farm_customers.json
  def index
    @farm_customers = FarmCustomer.all
  end

  # GET /farm_customers/1
  # GET /farm_customers/1.json
  def show
  end

  # GET /farm_customers/new
  def new
    @farm_customer = FarmCustomer.new
  end

  # GET /farm_customers/1/edit
  def edit
  end

  # POST /farm_customers
  # POST /farm_customers.json
  def create
    @farm_customer = FarmCustomer.new(farm_customer_params)

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
    respond_to do |format|
      if @farm_customer.update(farm_customer_params)
        format.html { redirect_to @farm_customer, notice: 'Farm customer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @farm_customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /farm_customers/1
  # DELETE /farm_customers/1.json
  def destroy
    @farm_customer.destroy
    respond_to do |format|
      format.html { redirect_to farm_customers_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_farm_customer
      @farm_customer = FarmCustomer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def farm_customer_params
      params[:farm_customer]
    end
end
