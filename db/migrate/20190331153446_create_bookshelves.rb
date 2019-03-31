class CreateBookshelves < ActiveRecord::Migration[5.2]
  def change
    create_table :bookshelves do |t|
      t.string :shelf_name
      t.integer :count
      t.references :reader, foreign_key: true

      t.timestamps
    end
  end
end
