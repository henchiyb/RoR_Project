class AppController < ApplicationController
  skip_before_action :require_signin, only: [:index,:mens,:womens]

  def index
    @latest_product = Product.order(:updated_at).first 10
    @special_product = Product.first 10
    @collection = Product.last 10
  end

  def checkout

  end

  def mens

  end

  def womens

  end

  def contact

  end
end
