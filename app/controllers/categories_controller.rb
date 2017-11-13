class CategoriesController < ApplicationController
  skip_before_action :require_signin, only: :show

  def show
    @cate = Category.find_by id: params[:id]
    @pro_of_cate = Product.joins(:sub_categories).where("sub_categories.category_id = ?", @cate.id).all.paginate(:page => params[:page], :per_page => 6)
  end
end
