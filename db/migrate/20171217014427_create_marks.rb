class CreateMarks < ActiveRecord::Migration[5.1]
  def change
    create_table :marks do |t|
      t.references :user, foreign_key: true
      t.references :bicycle, foreign_key: true

      t.timestamps
    end
  end
end
