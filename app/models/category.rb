class Category < ApplicationRecord
  has_many :sub_categories
  has_many :products, :through => :sub_categories

  class << self
    def get_categories_by_type type
      where(:cate_type => type)
    end
  end
end
