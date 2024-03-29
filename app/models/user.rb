class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :first_name, presence: true, allow_blank: false
  validates :last_name, presence: true, allow_blank: false
  has_many :cats, :dependent => :destroy
  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :comments, :dependent => :destroy
  has_many :favorites, :dependent => :destroy
  has_many :posts, through: :favorites

  def follow(cat)
    active_relationships.create(followed_id: cat.id)
  end

  def unfollow(cat)
    active_relationships.find_by(followed_id: cat.id).destroy
  end
 
  def following?(cat)
    following.include?(cat)
  end

  def owns?(cat)
    cats.include?(cat)
  end
  
  def favorited?(post)
    posts.where(id: post.id).exists?
  end

end
