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

  #
  # Callbacks
  #
  after_destroy :update_question_answered

  private
  def update_question_answered
    question.update_answered
  end
end
