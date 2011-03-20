class Admin::AnswersController < Admin::BaseController
  inherit_resources

  belongs_to :question

  def create
    @answer              = parent.answers.build(params[:answer])
    @answer.author_email = current_user.email
    @answer.created_at   = Time.zone.now

    @question.update_attributes(answered: true)
    create! { admin_question_answers_path(question_id: @question.to_param) }
  end
end
