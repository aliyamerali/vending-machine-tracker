class Snack < ApplicationRecord
  has_many :inventories
  has_many :machines, through: :inventories

  def self.avg_price
    average(:price)
  end
end
