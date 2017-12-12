class SearchesController < ApplicationController
  skip_before_action :require_signin

  def index
    @products = Product.search(params[:term]).paginate(:page => params[:page], :per_page => 16)
    @order_item = OrderItem.new
    respond_to do |format|
      format.html
      format.json { render json: @products }
    end
  end
end
