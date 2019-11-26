class Category < ApplicationRecord
  has_many:words,dependent: :destroy
  validates :name,presence:true,length:{maximum:19}
  validates :content,presence:true,length:{maximum:50}
end
