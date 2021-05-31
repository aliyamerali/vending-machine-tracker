require 'rails_helper'

RSpec.describe 'Machine Show Page', type: :feature do
  before :each do
    sam = Owner.create!(name: "Sam's Snacks")
    @dons = sam.machines.create!(location: "Don's Mixed Drinks")
    @turing = sam.machines.create!(location: "Turing Basement")

    @cheetos = Snack.create!(name: "Cheetos", price: 2.99)
    @chips = Snack.create!(name: "Lays", price: 0.99)
    @pretzels = Snack.create!(name: "Snyders", price: 1.99)

    @dons.snacks << @cheetos
    @dons.snacks << @chips

    @turing.snacks << @chips
    @turing.snacks << @pretzels
  end

  it 'Shows the name + price of all snacks associated with that machine' do
    visit "/machines/#{@dons.id}"

    expect(page).to have_content(@cheetos.name)
    expect(page).to have_content(@cheetos.price)
    expect(page).to have_content(@chips.name)
    expect(page).to have_content(@chips.price)
    expect(page).to_not have_content(@pretzels.name)
    expect(page).to_not have_content(@pretzels.price)
  end

  it 'shows average price for all of the snacks in that machine' do
    visit "/machines/#{@dons.id}"
    expect(page).to have_content('Average Price: $1.99')

    visit "/machines/#{@turing.id}"
    expect(page).to have_content('Average Price: $1.49')

  end
end
