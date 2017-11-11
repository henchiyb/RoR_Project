class ProductsController < ApplicationController
  skip_before_action :require_signin, only: [:index, :show]

  def index
    @product = Product.search(params[:search], params[:choice]).paginate(:page => params[:page], :per_page => 16)
  end

  def show
    @product = Product.find_by id: params[:id]
    @provider = Provider.find_by id: @product.provider_id
  end
end
