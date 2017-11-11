class Product < ApplicationRecord
  belongs_to :providers
  has_many :sub_categories
  has_many :categories, through: :sub_categories
end
