require 'spec_helper'

describe 'the login process', :type => :request do
  def try_login_with(email, password)
    visit root_path
    click_link 'Sign in'
    within('.new_user') do
      fill_in 'Email', with: email
      fill_in 'Password', with: password
    end
    click_button 'Sign in'
  end

  let(:email) {'andrea@example.com'}
  let(:password) {'password'}

  before { FactoryGirl.create(:user, email: email, password: password)}

  describe 'when user provides correct credentials' do
    it 'authentication is successful' do
      try_login_with(email, password)
      page.body.should have_content('Signed in successfully.')
    end
  end

  describe 'when user does not provide correct credentials' do
    it 'authentication fails' do
      try_login_with('', password)
      page.body.should have_content('Invalid email or password.')
    end
  end
end
