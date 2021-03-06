class PizzasController < ApplicationController
  helper PizzasHelper
  before_action :set_pizza, only: [:show, :edit, :update, :destroy]

  # GET /pizzas
  # GET /pizzas.json
  def index
    @pizzas = Pizza.all
    respond_to do |format|
      format.html
      format.csv do
        headers['Content-Disposition'] = "attachment; filename=\"pizzas.csv\""
        headers['Content-Type'] ||= 'text/csv'
      end
    end
  end


  # GET /pizzas/1
  # GET /pizzas/1.json
  def show
    @ingridients = get_pizza_ingridients
  end

  # GET /pizzas/new
  def new
    @pizza = Pizza.new
  end

  # GET /pizzas/1/edit
  def edit
  end

  # POST /pizzas
  # POST /pizzas.json
  def create
    @pizza = Pizza.new(pizza_params)

    respond_to do |format|
      if @pizza.save
        format.html { redirect_to @pizza, notice: 'Pizza was successfully created.' }
        format.json { render :show, status: :created, location: @pizza }
      else
        format.html { render :new }
        format.json { render json: @pizza.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pizzas/1
  # PATCH/PUT /pizzas/1.json
  def update
    respond_to do |format|
      if @pizza.update(pizza_params)
        format.html { redirect_to @pizza, notice: 'Pizza was successfully updated.' }
        format.json { render :show, status: :ok, location: @pizza }
      else
        format.html { render :edit }
        format.json { render json: @pizza.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pizzas/1
  # DELETE /pizzas/1.json
  def destroy
    @pizza.destroy
    respond_to do |format|
      format.html { redirect_to pizzas_url, notice: 'Pizza was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pizza
      @pizza = Pizza.find(params[:id])
      rescue ActiveRecord::RecordNotFound
      redirect_to('/menu', :notice => 'Record not found')
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pizza_params
      params.require(:pizza).permit(:name, :price)
    end

  def get_pizza_ingridients
    arr = Ingridient.find_by_sql(["select distinct i.name from ingridients i inner join ingridients_pizzas a on a.ingridient_id = i.id inner join pizzas p on a.pizza_id = p.id where a.pizza_id=?;", params[:id]])
    @items = arr.map{|x| x.name}
  end

  end


