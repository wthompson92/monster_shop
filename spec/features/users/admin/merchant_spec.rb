require 'rails_helper'

RSpec.describe 'Admin Merchant' do
  describe "As an Admin User, when I visi the merchant index page '/merchants'" do
    it "I click a merchant's name then my URI route should be '/admin/merchants/6'" do

      @megan = Merchant.create!(name: 'Megans Marmalades', address: '123 Main St', city: 'Denver', state: 'CO', zip: 80218)
      @admin123 = User.create!(user_name: "andrew@gmail.com", password: "thinking123", role: 2, name: "Andrew", address: "333 Market St", city: "Denver", state: "CO", zip: 80012 )

      visit root_path
      click_link 'Login'
      fill_in "User name", with: "andrew@gmail.com"
      fill_in "Password", with: "thinking123"
      click_button "Log In"
      click_link 'Merchants'
      click_link(@megan.name)
      expect(current_path).to eq("/admin/merchants/#{@megan.id}")
    end
  end
end
