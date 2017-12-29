class AddImageToBicycles < ActiveRecord::Migration[5.1]
  def change
    add_column :bicycles, :image, :string
  end
end
