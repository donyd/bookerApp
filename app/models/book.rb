class Book < ApplicationRecord
  belongs_to :bookshelf

  def self.search(params)
    books = Book.where("title LIKE ? or author_lastname LIKE ?", "%#{params[:search]}%",
      "%#{params[:search]}%") if params[:search].present?
    books
  end
end
