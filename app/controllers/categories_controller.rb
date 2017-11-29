class CategoriesController < ApplicationController
  skip_before_action :require_signin, only: :show

  def show
    @category = Category.find_by id: params[:id]
    @pro_of_cate = Product.get_product_of_category(@category.id).paginate(:page => params[:page], :per_page => 6)
    @order_item = current_order.order_items.new
  end
end
