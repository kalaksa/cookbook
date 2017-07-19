require 'rails_helper'

describe 'comments' do
  before do
    User.delete_all
  end
  let!(:user) {
    user = User.create!(username: 'name', email: 'test0@test.com', password: '!123456t', password_confirmation: '!123456t')
    user.confirm
    return user
  }

  let(:recipe) { Recipe.create!(title: 'banana cake', components: 'flour, banana', body: 'Preparation: mix it all', user: user)}
  it 'does not display the author of comments section if the user is log in' do
    visit new_user_session_path
    fill_in 'Email', :with => 'test0@test.com'
    fill_in 'Password', :with => '!123456t'
    click_button 'Log in'
    page.should have_content('Signed in successfully.')
    visit recipe_path(recipe.id)
    page.should_not have_field('Your name')
    page.should have_field('Your comment')
    page.should have_selector(:link_or_button, 'Submit')
  end
  it 'displays the author of comments section if the user isn\'t log in' do
    visit recipe_path(recipe.id)
    page.should have_field('Your name')
    page.should have_field('Your comment')
    page.should have_selector(:link_or_button, 'Submit')
  end
end
