require 'rails_helper'

RSpec.feature "Visitor add product from home page by clicking on an Add button", type: :feature, js:true do
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

  scenario "They see My Cart(0) changes to My Cart(1)" do
    # ACT

    visit root_path
    # puts page.html
    click_button("Add", match: :first).click
    # sleep 5
    # DEBUG
    save_screenshot

    # VERIFY
  expect(page).to have_content 'My Cart (1)'
  end
end