class AddProviderToProduct < ActiveRecord::Migration[5.1]
  def change
    add_reference :products, :provider, foreign_key: true
  end
end
