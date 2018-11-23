class Profile < ApplicationRecord
  def name
    self.cat.name
  end
  belongs_to :cat
  has_many :shares
  has_many :posts, through: :shares
end
