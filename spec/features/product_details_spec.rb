require 'rails_helper'

RSpec.feature "Visitor navigates to product details page", type: :feature, js: true do
  
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

  scenario 'see the description of the selected product' do
    visit root_path
    id = rand(1..10)
    description = find("article.id#{id}").find(".description")
    puts description
    find("article.id#{id}").click
    save_screenshot
  end
end
