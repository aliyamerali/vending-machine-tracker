class Snack < ApplicationRecord
  has_many :inventories
  has_many :machines, through: :inventories

end
