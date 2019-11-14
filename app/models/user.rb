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
end
