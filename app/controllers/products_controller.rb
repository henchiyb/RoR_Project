class ProductsController < ApplicationController
  skip_before_action :require_signin, only: [:index, :show]
  before_action :new_order_item

  def index
    @product = Product.search(params[:search], params[:choice]).paginate(:page => params[:page], :per_page => 16)
  end

  def show
    @product = Product.find_by id: params[:id]
  end

  private
  def new_order_item
    @order_item = current_order.order_items.new
  end
end
