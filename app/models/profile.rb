class Profile < ApplicationRecord
  def name
    self.cat.username
  end
  belongs_to :cat
  has_many :shares, :dependent => :destroy
  has_many :posts, through: :shares
end
