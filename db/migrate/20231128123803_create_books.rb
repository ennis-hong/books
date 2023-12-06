class CreateBooks < ActiveRecord::Migration[7.1]
  def change
    create_table :books do |t|
      t.string :title
      t.text :description
      t.decimal :price
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
