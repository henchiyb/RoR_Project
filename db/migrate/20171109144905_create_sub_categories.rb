class CreateSubCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :sub_categories do |t|
      t.belongs_to :category, index: true
      t.belongs_to :product, index: true
    end
  end
end
