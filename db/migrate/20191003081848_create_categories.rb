class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :event, null: false
      t.string :opponent, null: false
      t.string :cat_num, null: false

      t.timestamps
    end
    add_index :categories, [:event, :opponent], unique: true
  end
end
