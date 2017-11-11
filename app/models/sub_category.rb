class SubCategory < ApplicationRecord
  belongs_to :products
  belongs_to :categories
end
