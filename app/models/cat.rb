class Cat < ApplicationRecord
  validates_uniqueness_of :username, :case_sensitive => false
  belongs_to :breed
  belongs_to :user
end
