require 'spec_helper'

describe 'the registration process', :type => :request do
  def try_signup_with(email, password, password_confirmation)
    visit new_user_registration_path
    within('.new_user') do
      fill_in 'Email', with: email
      fill_in 'Password', with: password
      fill_in 'Password confirmation', with: password_confirmation
    end
    click_button 'Sign up'
  end

  context 'when user insert valid data' do
    it 'successfully register' do
      try_signup_with 'andrea@example.com', 'asdasd', 'asdasd'
      page.body.should have_content 'Welcome! You have signed up successfully.'
    end

    it 'creates new user with expected email' do
      email = 'andrea@example.com'
      try_signup_with email, 'asdasd', 'asdasd'
      User.find_by_email(email).should be_a(User)
    end
  end

  context 'when user insert invalid data' do
    it 'fails registration due to missing email' do
      try_signup_with '', 'asdasd', 'asdasd'
      page.body.should have_content "Email can't be blank"
    end

    it 'fails registration due to missing password' do
      try_signup_with 'andrea@example.com', '', 'asdasd'
      page.body.should have_content "Password can't be blank"
    end

    it 'fails registration due to different password and password confirmation' do
      try_signup_with 'andrea@example.com', 'qweqwe', 'asdasd'
      page.body.should have_content "Password doesn't match confirmation"
    end
  end
end
