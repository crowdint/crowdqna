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
end
