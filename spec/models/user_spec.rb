require 'spec_helper'

describe User do
  it 'requires email' do
    FactoryGirl.build(:user, email: nil).should have_at_least(1).error_on(:email)
  end

  it 'requires password' do
    FactoryGirl.build(:user, password: nil).should have_at_least(1).error_on(:password)
  end
end
