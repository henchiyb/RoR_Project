class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :cate_type #0 la men, 1 la women, 2 la watches
    end
  end
end
