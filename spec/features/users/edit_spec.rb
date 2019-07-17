Rspec.describe do
  describe "Edit User Profile" do
  describe "As a registered user, when I visit my profile page" do
    nathan = User.create!(user_name: "nthomas", password: "123",  password_confirmation: "123", name: "Nathan Thomas", address: "123 Main St", city: "Gunbarrel", state: "Colorado", zip: 80301)
    visit root_path
    click_link "Login"
    fill_in "User name", with: "nthomas"
    fill_in "Password", with: "123"
    click_button "Log In"
  end
    it "I see a link to edit my profile data"
    visit

end
end
end
  When I visit my profile page
I see a link to edit my profile data
When I click on the link to edit my profile data
I see a form like the registration page
The form is prepopulated with all my current information except my password
When I change any or all of that information
And I submit the form
Then I am returned to my profile page
And I see a flash message telling me that my data is updated
And I see my updated information
