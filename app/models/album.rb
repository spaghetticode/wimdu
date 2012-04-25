class Album < ActiveRecord::Base
  belongs_to :user
  attr_accessible :author, :title

  validates :user,   presence: true
  validates :title,  presence: true, allow_blank: false
  validates :author, presence: true, allow_blank: false
end
