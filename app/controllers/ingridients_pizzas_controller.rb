class IngridientsPizzasController < ApplicationController
  before_action :set_ingridients_pizza, only: [:show, :edit, :update, :destroy]

  # GET /ingridients_pizzas
  # GET /ingridients_pizzas.json
  def index
    @ingridients_pizzas = IngridientsPizza.all
  end

  # GET /ingridients_pizzas/1
  # GET /ingridients_pizzas/1.json
  def show
  end

  # GET /ingridients_pizzas/new
  def new
    @ingridients_pizza = IngridientsPizza.new
  end

  # GET /ingridients_pizzas/1/edit
  def edit
  end

  # POST /ingridients_pizzas
  # POST /ingridients_pizzas.json
  def create
    @ingridients_pizza = IngridientsPizza.new(ingridients_pizza_params)

    respond_to do |format|
      if @ingridients_pizza.save
        format.html { redirect_to @ingridients_pizza, notice: 'Ingridients pizza was successfully created.' }
        format.json { render :show, status: :created, location: @ingridients_pizza }
      else
        format.html { render :new }
        format.json { render json: @ingridients_pizza.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ingridients_pizzas/1
  # PATCH/PUT /ingridients_pizzas/1.json
  def update
    respond_to do |format|
      if @ingridients_pizza.update(ingridients_pizza_params)
        format.html { redirect_to @ingridients_pizza, notice: 'Ingridients pizza was successfully updated.' }
        format.json { render :show, status: :ok, location: @ingridients_pizza }
      else
        format.html { render :edit }
        format.json { render json: @ingridients_pizza.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ingridients_pizzas/1
  # DELETE /ingridients_pizzas/1.json
  def destroy
    @ingridients_pizza.destroy
    respond_to do |format|
      format.html { redirect_to ingridients_pizzas_url, notice: 'Ingridients pizza was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ingridients_pizza
      @ingridients_pizza = IngridientsPizza.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ingridients_pizza_params
      params.require(:ingridients_pizza).permit(:pizza_id, :ingridient_id)
    end
end
