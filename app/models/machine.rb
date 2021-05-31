class Machine < ApplicationRecord
  validates_presence_of :location

  belongs_to :owner
  has_many :inventories
  has_many :snacks, through: :inventories
end
