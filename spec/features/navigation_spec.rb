require 'rails_helper'

RSpec.describe 'Site Navigation' do
  describe 'As a Visitor' do
    it "I see a nav bar with links to all pages" do
      visit '/merchants'

      within 'nav' do
        click_link 'Items'
      end

      expect(current_path).to eq('/items')

      within 'nav' do
        click_link 'Merchants'
      end

      expect(current_path).to eq('/merchants')

      within 'nav' do
        click_link "Cart:"
      end

      expect(current_path).to eq('/cart')

      within 'nav' do
        click_link 'Log In'
      end

      expect(current_path).to eq(login_path)

      within 'nav' do
        click_link 'User Regestration'
      end
        expect(current_path).to eq(new_user_path)

      within 'nav' do
        click_link 'Home'
      end

      expect(current_path).to eq('/merchants')
    end

    it 'I see a cart indicator in my nav bar' do
      visit '/items'

      within 'nav' do
        expect(page).to have_content("Cart: 0")
      end
    end

    # it 'I see a link to my cart in my nav bar' do
    #   within 'nav' do
    #     click_link "Cart: #{@cart.count}"
    #   end
    #   expect(current_path).to eq('/cart')
    # end

    # it 'I see a link to log in' do
    #   within 'nav' do
    #     click_link 'Log In'
    #   end
    #   expect(current_path).to eq('/login')
    # end

    # it 'I see a link to the user registration page' do
    #   within 'nav' do
    #     click_link 'User Regestration'
    #   end
    #   expect(current_path).to eq('/register')
    # end

    # it 'I see a link to return to the welcome / home page' do
    #   within 'nav' do
    #     click_link 'Home'
    #   end
    #   expect(current_path).to eq('/merchants')
    #end
  end
end
