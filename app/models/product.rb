class Product < ApplicationRecord
  has_many :order_items, dependent: :destroy
  belongs_to :providers
  has_many :sub_categories
  has_many :categories, through: :sub_categories

  class << self
    def search search_key, choice
      if choice.eql? "all"
        where("name LIKE ?", "%#{search_key}%")
      elsif choice.eql? "mw"
        joins(:categories).where("products.name LIKE ? AND categories.cate_type = 0", "%#{search_key}%")
      elsif choice.eql? "ww"
        joins(:categories).where("products.name LIKE ? AND categories.cate_type = 1", "%#{search_key}%")
      elsif choice.eql? "w"
        joins(:categories).where("products.name LIKE ? AND categories.cate_type = 2", "%#{search_key}%")
      end
    end
  end
end
