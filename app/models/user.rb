class User < ApplicationRecord
  
  #Filter method to transform email to small cases before saving to db 
  before_save{email.downcase!}  #dall letters be small

  validates :name,presence:true,length:{maximum:50}

  # REGEX = Regular Expression
  #To variable correct email structure
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email,presence:true,length:{maximum:50},
                                 format:{with: EMAIL_REGEX},
                                 uniqueness: {case_sensitive: false} #big or small letter no matter
  has_secure_password
  validates :password,length: {minimum:6},allow_nil:true

  has_many :lessons, dependent: :destroy

  has_many :activities,dependent: :destroy

  def lesson_taken(cat_id)
    lesson = lessons.find_by(category_id: cat_id)
  end

  has_many :active_relationships, class_name: "Relationship",
                                   foreign_key: "follower_id",
                                   dependent: :destroy

  has_many :passive_relationships, class_name: "Relationship",
                                   foreign_key: "following_id",
                                   dependent: :destroy

  has_many :following,through: :active_relationships, source: :following
  has_many :followers,through: :passive_relationships, source: :follower
  
  #follow a user
  def follow(other_user)
    active_relationships.create(following_id: other_user.id)
  end

  #unfollows a user
  def unfollow(other_user)
    active_relationships.find_by(following_id: other_user.id).destroy
  end

  #Returs true if the curent user is following the other user.
  def following?(other_user)
    following.include?(other_user)
  end

end
