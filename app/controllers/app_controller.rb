class AppController < ApplicationController
  skip_before_action :require_signin, only: :index

  def index
    @latest_product = Product.order("updated_at DESC").first 10
    @special_product = Product.first 10
    @collection = Product.last 10
  end

  def checkout

  end

  def contact

  end
end
