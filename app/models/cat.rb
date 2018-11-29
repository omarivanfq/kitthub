class Cat < ApplicationRecord
  validates_uniqueness_of :username, :case_sensitive => false
  validates_length_of :username, minimum: 6, maximum: 14
  validates :dob, presence: true
  validate :dob_before_today

  def dob_before_today
    if dob.present? && dob > Date.today
      errors.add(:dob, "must be before today")
    end
  end

  belongs_to :breed
  belongs_to :user
  has_one :profile, dependent: :destroy
  has_many :shares
  has_many :sharedposts, through: :shares, foreign_key: "cat_id"
  has_many :posts, dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :follower
end
