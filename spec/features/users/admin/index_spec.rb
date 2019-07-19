require 'rails_helper'

RSpec.describe "Admin Index" do
  describe "As an admin" do
    before :each do
      @admin = User.create!(user_name: "andrew@gmail.com", password: "thinking123", role: 2, name: "Andrew", address: "333 Market St", city: "Denver", state: "CO", zip: 80012 )

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)
    end

    describe "When I click the Users link in the nav bar"do
      it  "I am taken to a user index page and see a full list of registered users and each users name is a link" do
        expect(current_path).to eq(admin_user_path(@megan))
        click_link "Users"
        expect(current_path).to eq(admin_users_path)
        expect(page).to have_link(@megan.user_name)
        expect(page).to have_content(@megan.created_at)
        expect(page).to have_content(@megan.role)
      end
    end 
  end
end
