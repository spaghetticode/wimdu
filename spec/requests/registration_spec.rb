require 'spec_helper'

describe 'the registration process', :type => :request do
  def try_login_with(email, password, password_confirmation)
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    fill_in 'Password confirmation', with: password_confirmation
  end

  context 'when user insert valid data' do
    before do
      visit new_user_registration_path
      within('.new_user') do
        try_login_with 'andrea@example.com', 'asdasd', 'asdasd'
      end
      click_button 'Sign up'
    end

    it 'successfully register' do
      page.body.should have_content 'Welcome! You have signed up successfully.'
    end

    it 'creates new user with expected email' do
      User.find_by_email('andrea@example.com').should be_a(User)
    end
  end

  context 'when user insert invalid data' do
    before do
      visit new_user_registration_path
      within('.new_user') do
        try_login_with '', 'asdasd', 'asdasd'
      end
      click_button 'Sign up'
    end

    it 'fails registration' do
      page.body.should have_content "Email can't be blank"
    end
  end
end
