class Word < ApplicationRecord
  belongs_to:category
  has_many:choices,dependent: :destroy
  accepts_nested_attributes_for:choices

  validates :content,presence:true,length:{maximum:30}
  validate :has_one_correct_answer
  validate :has_unique_choice

  def has_unique_choice    
      
    if choices.uniq{|choice| choice.content}.length != choices.length
      return errors.add :base, "Must have unique choices"
    end
  end

  def has_one_correct_answer
    if choices.select{|choice| choice.isCorrect?}.count != 1
      return errors.add :base,"Must have one correct choice"
    end
  end


  def correct_answer
    choices.find_by(isCorrect:true).try(:content)
  end
end


