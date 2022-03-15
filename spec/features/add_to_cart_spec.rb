require 'rails_helper'

RSpec.feature "Visitor's adds an item to their cart", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'
  
    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario 'The item count in the top nav cart will update from 0 to 1' do
    # ACT
    visit root_path
    first('.product').click_button('Add')

    # VERIFY
    expect(page).to have_content('My Cart (1)')

  end
end
