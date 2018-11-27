class Post < ApplicationRecord
  mount_uploader :picture, PictureUploader
  belongs_to :cat
  has_many :taggings, :dependent => :destroy
  has_many :tags, through: :taggings
  has_many :comments
  has_many :favorites
  has_many :users, through: :favorites
  has_many :shares, :dependent => :destroy
  has_many :profiles, through: :shares
  
  def all_tags=(names)
    self.tags = names.split(",").map do |name|
      Tag.where(name: name.strip).first_or_create!
    end
  end

  def all_tags
    self.tags.map(&:name).join(", ")
  end

  def self.tagged_with(name)
    Tag.find_by_name!(name).posts
  end
end
