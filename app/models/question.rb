class Question
  include Mongoid::Document

  #
  # Fields
  #
  field :question_text, type: String

  #
  # Associations
  #
  embeds_many :answers
end
