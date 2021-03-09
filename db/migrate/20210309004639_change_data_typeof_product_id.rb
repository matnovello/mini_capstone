class ChangeDataTypeofProductId < ActiveRecord::Migration[6.1]
  def change
    remove_column :images, :product_id, :string
  end
end
