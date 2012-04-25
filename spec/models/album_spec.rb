require 'spec_helper'

describe Album do
  it 'requires a title' do
    FactoryGirl.build(:album, title: '').should have_at_least(1).error_on(:title)
  end

  it 'requires an author' do
    FactoryGirl.build(:album, author: '').should have_at_least(1).error_on(:author)
  end

  it 'requires a user' do
    FactoryGirl.build(:album, user: nil).should have_at_least(1).error_on(:user)
  end
end
