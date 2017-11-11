class ProductsController < ApplicationController
  skip_before_action :require_signin, only: :show

  def show
    @product = Product.find_by id: params[:id]
    @provider = Provider.find_by id: @product.provider_id
  end
end
