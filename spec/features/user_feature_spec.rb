require 'spec_helper'

describe "User sign up, log in, sign out" do

  let!(:valid_user) {User.create(name: "Beini Huang", email: "beini@bee.com", password: "password")}

  describe "user sign up" do

    before(:each) do
      visit '/'
      click_link('Sign Up')
    end

    it 'successfully signs up with a name, email, and password' do
      expect(current_path).to eq('/registrations/signup')
      fill_in("name", :with => valid_user.name)
      fill_in("email", :with => valid_user.email)
      fill_in("password", :with => valid_user.password)
      click_button('Sign Up')
      expect(current_path).to eq('/users/home')
      expect(page).to have_content("Welcome, #{valid_user.name}!")
    end

  end

  describe "user login" do
    before(:each) do
      visit '/'
      click_link('Log In')
    end

end 
end
