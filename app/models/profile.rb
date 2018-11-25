class Profile < ApplicationRecord
  def name
    self.cat.username
  end
  belongs_to :cat, dependent: :destroy
  has_many :shares
  has_many :posts, through: :shares
end
