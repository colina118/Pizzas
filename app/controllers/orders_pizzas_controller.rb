class OrdersPizzasController < ApplicationController
  before_action :set_orders_pizza, only: [:show, :edit, :update, :destroy]

  # GET /orders_pizzas
  # GET /orders_pizzas.json
  def index
    @orders_pizzas = OrdersPizza.all
  end

  # GET /orders_pizzas/1
  # GET /orders_pizzas/1.json
  def show
  end

  # GET /orders_pizzas/new
  def new
    @orders_pizza = OrdersPizza.new
  end

  # GET /orders_pizzas/1/edit
  def edit
  end

  # POST /orders_pizzas
  # POST /orders_pizzas.json
  def create
    @orders_pizza = OrdersPizza.new(orders_pizza_params)

    respond_to do |format|
      if @orders_pizza.save
        format.html { redirect_to @orders_pizza, notice: 'Orders pizza was successfully created.' }
        format.json { render :show, status: :created, location: @orders_pizza }
      else
        format.html { render :new }
        format.json { render json: @orders_pizza.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders_pizzas/1
  # PATCH/PUT /orders_pizzas/1.json
  def update
    respond_to do |format|
      if @orders_pizza.update(orders_pizza_params)
        format.html { redirect_to @orders_pizza, notice: 'Orders pizza was successfully updated.' }
        format.json { render :show, status: :ok, location: @orders_pizza }
      else
        format.html { render :edit }
        format.json { render json: @orders_pizza.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders_pizzas/1
  # DELETE /orders_pizzas/1.json
  def destroy
    @orders_pizza.destroy
    respond_to do |format|
      format.html { redirect_to orders_pizzas_url, notice: 'Orders pizza was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_orders_pizza
      @orders_pizza = OrdersPizza.find(params[:id])
     rescue ActiveRecord::RecordNotFound
      redirect_to('/menu', :notice => 'Record not found')
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def orders_pizza_params
      params.require(:orders_pizza).permit(:order_id, :pizza_id)
    end
end
