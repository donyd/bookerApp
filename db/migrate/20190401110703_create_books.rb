class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author_firstname
      t.string :author_lastname
      t.date :year
      t.string :genre
      t.references :bookshelf, foreign_key: true

      t.timestamps
    end
  end
end
