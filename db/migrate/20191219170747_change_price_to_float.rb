class ChangePriceToFloat < ActiveRecord::Migration[5.1]
  def change
    change_column :snacks, :price, :float
  end
end
