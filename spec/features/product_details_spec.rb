require 'rails_helper'

RSpec.feature "Visitor navigates to to Product pages", type: :feature, js: true do
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

  scenario "They see a product's details after clicking on it " do
    # ACT
    visit root_path

    # DEBUG / VERIFY
    click_on('Details', match: :first)
    
    
    expect(page).to have_content('Quantity')
    save_screenshot
  end
end
