class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy, :confirm]
  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new(:express_token => params[:token])
  end

 def express_checkout
  response = EXPRESS_GATEWAY.setup_purchase(YOUR_TOTAL_AMOUNT_IN_CENTS,
    return_url: YOUR_RETURN_URL_,
    cancel_return_url: YOUR_CANCEL_RETURL_URL,
    currency: "USD",
    allow_guest_checkout: true,
    items: [{name: "Order", description: "Order description", quantity: "1", amount: AMOUNT_IN_CENTS}]
  )
  redirect_to EXPRESS_GATEWAY.redirect_url_for(response.token)
end



  # GET /orders/1/edit
  def edit
  end

  def empty
    @empty = @order.destroy.all
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end    

  def confirm
  end
    
         

  # POST /orders
  # POST /orders.json
 
def create
  @order = @cart.build_order(order_params)

  if @order.save
    if @order.purchase # this is where we purchase the order. refer to the model method below
      redirect_to order_url(@order)
    else
      render :action => "failure"
    end
  else
    render :action => 'new'
  end
end

  # def create
  #   @order = Order.new(order_params)

  #   respond_to do |format|
  #     if @order.save
  #       format.html { redirect_to confirm_order_path(@order), notice: 'Order was successfully created.' }
  #       format.json { render :show, status: :created, location: @order }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @order.errors, status: :unprocessable_entity }
  #     end

  #   end

  # end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params.merge(status: 'submitted'))
        session[:order_id] = nil
        format.html { redirect_to confirm_order_path(@order), notice: 'Order was successfully updated.' }
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
      format.html { redirect_to products_path, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:user_id, :status, :address_id)
    end
end
