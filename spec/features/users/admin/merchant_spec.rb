require 'rails_helper'

RSpec.describe 'Admin Merchant' do
  describe "As an Admin User, when I visit the merchant index page '/merchants'" do
    before :each do
      @megan = Merchant.create!(name: 'Megans Marmalades', address: '123 Main St', city: 'Denver', state: 'CO', zip: 80218)
      @admin123 = User.create!(user_name: "andrew@gmail.com", password: "thinking123", role: 2, name: "Andrew", address: "333 Market St", city: "Denver", state: "CO", zip: 80012 )

      visit root_path
      click_link 'Login'
      fill_in "User name", with: "andrew@gmail.com"
      fill_in "Password", with: "thinking123"
      click_button "Log In"
      click_link 'Merchants'
    end

      it "I click a merchant's name then my URI route should be '/admin/merchants/6'" do
        click_link(@megan.name)

        expect(current_path).to eq("/admin/merchants/#{@megan.id}")
      end

    describe "I see a 'disable' button to any merchants who are not yet disabled" do
      it "When I click that button, I am returned to admin's merchant index where the account is disabled and see a flash message" do
        expect(page).to have_button('Disable')
        click_button 'Disable'
        expect(current_path).to eq(merchants_path)
        expect(page).to have_content("#{@megan.name} is now disabled.")
      end
    end
  end
end

# I see a "disable" button next to any merchants who are not yet disabled
# When I click on the "disable" button
# I am returned to the admin's merchant index page where I see that the merchant's account is now disabled
# And I see a flash message that the merchant's account is now disabled
