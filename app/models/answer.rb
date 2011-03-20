class Answer
  include Mongoid::Document
  include Mongoid::Timestamps

  #
  # Associations
  #
  embedded_in :question

  #
  # Fields
  #
  field :answer_text  , type: String
  field :author_email , type: String

  #
  # Validations
  #
  validates_presence_of :answer_text
end
