class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
    @precio = get_price
    @pizzas = get_order_pizza
    respond_to do |format|
      format.html
      format.csv do
        headers['Content-Disposition'] = "attachment; filename=\"ordenes.csv\""
        headers['Content-Type'] ||= 'text/csv'
      end
    end
  end


  # GET /orders/1
  # GET /orders/1.json
  def show
    @pizzas = get_order_pizza
    @precio = get_price
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
      rescue ActiveRecord::RecordNotFound
      redirect_to('/menu', :notice => 'Record not found')
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:client_id, :branch_id)
    end

  def get_order_pizza
    arri = Pizza.find_by_sql(["select p.name from pizzas p inner join orders_pizzas a on a.pizza_id = p.id inner join orders o on a.order_id = o.id where order_id = ?;", params[:id]])
    arri.map{|x| x.name}
  end
  def get_price
   arre = Pizza.find_by_sql(["select sum(p.price) as precio from pizzas p inner join orders_pizzas a on a.pizza_id = p.id inner join orders o on a.order_id = o.id where order_id = ?;", params[:id]])
   arre.map {|x| x.precio}

  end

end
