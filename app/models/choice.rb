class Choice < ApplicationRecord
  belongs_to :word
  validates :content,presence:true,length:{maximum:25}
  has_many :answers

end
