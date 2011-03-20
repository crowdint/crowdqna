class Question
  include Mongoid::Document
  include Mongoid::Timestamps

  #
  # Fields
  #
  field :question_text , type: String
  field :answered      , type: Boolean

  #
  # Associations
  #
  embeds_many :answers

  #
  # Validations
  #
  validates_presence_of :question_text

  def answer_count
    answers.count
  end

  def update_answered
    update_attributes(:answered => (answer_count > 0))
  end
end
