require 'rails_helper'

RSpec.describe Snack, type: :model do
  describe 'relationships' do
    it {should have_many(:machines).through(:inventories)}
  end

  describe 'class methods' do
    it '.avg_price returns average price of a set of snacks' do
      Snack.create!(name: "Cheetos", price: 2.99)
      Snack.create!(name: "Lays", price: 0.99)
      Snack.create!(name: "Snyders", price: 1.99)

      expect(Snack.avg_price).to eq(1.99)
    end

    it '.kind_count returns the number of different snack names in a set' do
      Snack.create!(name: "Cheetos", price: 2.99)
      Snack.create!(name: "Lays", price: 0.99)
      Snack.create!(name: "Snyders", price: 1.99)

      expect(Snack.kind_count).to eq(3)
    end
  end
end
