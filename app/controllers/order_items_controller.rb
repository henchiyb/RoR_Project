class OrderItemsController < ApplicationController
  before_action :set_current_order, only: [:create, :update, :destroy]
  after_action :update_subtotal_order, only: [:create, :update, :destroy]

  def create
    @order_item = @order.order_items.find_by product_id: order_item_params[:product_id]
    if @order_item
      @order_item.update_attributes :quantity => order_item_params[:quantity]
    else
      @order_item = @order.order_items.build order_item_params
      @order.save
    end
    flash[:success] = "Added to your cart!"
    session[:order_id] = @order.id
  end

  def update
    @order_item = @order.order_items.find params[:id]
    @order_item.update_attributes order_item_params
    @order_items = @order.order_items
  end

  def destroy
    @order_item = @order.order_items.find params[:id]
    @order_item.destroy
    @order_items = @order.order_items
  end

  private
  def order_item_params
    params.require(:order_item).permit(:quantity, :product_id)
  end

  def set_current_order
    @order = current_order
  end

  def update_subtotal_order
    @order.update_attributes :subtotal => @order.subtotal
  end
end
