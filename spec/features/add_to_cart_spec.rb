require 'rails_helper'

RSpec.feature "Visitor adds an item to the cart", type: :feature, js: true do
  
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

  scenario 'check to see if the number of items in cart is 1 greater than before addition' do
    visit root_path
    id = rand(1..10)
    find("article.id#{id}").find("footer").find("button").click
    expect(page).to have_content 'My Cart (1)';
    save_screenshot
  end
end
