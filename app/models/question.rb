class Question
  include Mongoid::Document
  include Mongoid::Timestamps

  cattr_accessor :madmimi_api_key, :madmimi_api_login

  after_create :send_notification

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

  def send_notification
    madmimi = MadMimi.new(Question.madmimi_api_login, Question.madmimi_api_key)
    options = {
      promotion_name: 'QNA',
      recipients:     'qna@crowdint.com',
      subject:        "Pregunta de QNA",
      from:           "qna@crowdint.com",
      reply_to:       "noreply@crowdint.com"
    }
    madmimi.send_mail(options, { question_text: question_text })
  end
end
