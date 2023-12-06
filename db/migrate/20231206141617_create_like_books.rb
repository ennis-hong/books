class CreateLikeBooks < ActiveRecord::Migration[7.1]
  def change
    create_table :like_books do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :book, null: false, foreign_key: true

      t.timestamps
    end
  end
end
