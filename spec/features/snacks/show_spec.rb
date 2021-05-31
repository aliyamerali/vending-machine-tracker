require 'rails_helper'

RSpec.describe 'Snack show page', type: :feature do
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

  it 'shows the snack name and price' do
    visit "/snacks/#{@chips.id}"

    expect(page).to have_content(@chips.name)
    expect(page).to have_content(@chips.price)

    visit "/snacks/#{@pretzels.id}"

    expect(page).to have_content(@pretzels.name)
    expect(page).to have_content(@pretzels.price)
  end

  it 'shows the locations where the snack is available' do
    visit "/snacks/#{@chips.id}"

    expect(page).to have_content(@dons.location)
    expect(page).to have_content(@turing.location)

    visit "/snacks/#{@pretzels.id}"

    expect(page).to have_content(@turing.location)
  end

  it 'for each location, shows the total number of snacks and average price' do
    visit "/snacks/#{@chips.id}"

    expect(page).to have_content("#{@dons.location} (2 kinds of snacks, average price of $1.99)")
    expect(page).to have_content("#{@turing.location} (2 kinds of snacks, average price of $1.49)")
  end
end
