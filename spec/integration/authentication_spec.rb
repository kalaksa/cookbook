require 'spec_helper'

describe "authentication" do
  before do
    User.delete_all
    User.create!(email: "test0@test.com", password: "!123456t", password_confirmation: "!123456t")
  end
  it 'lets the user log in' do
    visit new_user_session_path
    fill_in "Email", :with => 'test0@test.com'
    fill_in "Password", :with => '!123456t'
    click_button "Log in"
    page.should have_content('Signed in successfully.')
  end
end
