require 'spec_helper'

describe 'authentication' do

  before(:all) do
    User.delete_all
    User.create!(email: 'test0@test.com', password: '!123456t', password_confirmation: '!123456t')
  end

  it 'user should not be able to log in without confirmation' do
    user = User.last
    visit new_user_session_path
    fill_in 'Email', with: 'test0@test.com'
    fill_in 'Password', with: '!123456t'
    click_button 'Log in'
    page.should have_content('You have to confirm your email address before continuing.')
    visit root_path
    page.should have_selector(:link_or_button, 'Log in')
    page.should have_selector(:link_or_button, 'Sign up')
  end

  it 'lets the user log in' do
    user = User.last
    user.confirm
    visit new_user_session_path
    fill_in 'Email', with: 'test0@test.com'
    fill_in 'Password', with: '!123456t'
    click_button 'Log in'
    page.should have_content('Signed in successfully.')
    visit root_path
    page.should have_selector(:link_or_button, 'Log out')
  end
end
