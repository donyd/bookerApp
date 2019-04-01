class Bookshelf < ApplicationRecord
  belongs_to :reader
  has_many :books
end
