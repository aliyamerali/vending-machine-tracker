class Snack < ApplicationRecord
  has_many :inventories
  has_many :machines, through: :inventories

  def self.avg_price
    average(:price)
  end

  def self.kind_count
    distinct(:name).count
  end

end
