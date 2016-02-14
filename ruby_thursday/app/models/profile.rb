class Profile < ActiveRecord::Base

  belongs_to :member

  validates_presence_of :bio
  validates_presence_of :member_id
end
