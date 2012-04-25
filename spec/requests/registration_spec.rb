require 'spec_helper'

describe 'the registration process', :type => :request do

  def try_login_with(email, password, password_confirmation)
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    fill_in 'Password confirmation', with: password_confirmation
  end

  context 'when user insert valid data' do
    it 'successfully register' do
      visit new_user_registration_path
      within('.new_user') do
        try_login_with 'andrea@example.com', 'asdasd', 'asdasd'
      end
      click_button 'Sign up'
      page.body.should have_content 'Welcome! You have signed up successfully.'
    end
  end

  context 'when user insert invalid data' do
    it 'fails registration' do
      visit new_user_registration_path
      within('.new_user') do
        try_login_with '', 'asdasd', 'asdasd'
      end
      click_button 'Sign up'
      page.body.should have_content "Email can't be blank"
    end
  end
end
