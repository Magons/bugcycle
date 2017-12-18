class AddCategotyToBicycles < ActiveRecord::Migration[5.1]
  def change
    add_reference :bicycles, :category, foreign_key: true
  end
end
