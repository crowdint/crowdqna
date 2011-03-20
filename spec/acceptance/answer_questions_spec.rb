require File.expand_path(File.dirname(__FILE__) + '/acceptance_helper')

feature "Answer Questions", %q{
  In order to give feedback
  As a Admin
  I want to answer questions
} do

  include Warden::Test::Helpers

  background do
    @user = Fabricate(:admin)
    login_as @user
  end

  scenario "Answer questions" do
    question          = Fabricate(:question)
    answer_attributes = Fabricate.attributes_for(:answer)

    visit admin_questions_path

    page.has_content?(question.question_text).should be_true

    click_link I18n.t('admin.questions.index.answers')

    current_path.should == admin_question_answers_path(question_id: question.to_param)

    click_link I18n.t('admin.answers.index.answer_question')

    fill_in 'Answer', with: answer_attributes[:answer_text]
    click_button I18n.t('common.submit')

    question.reload
    answer = question.answers.first

    question.answered.should   == true
    answer.answer_text.should  == answer_attributes[:answer_text]
    current_path.should        == admin_question_answers_path(question_id: question.to_param)
    answer.author_email.should == @user.email
    answer.created_at.should_not be_nil

    page.has_content?(answer_attributes[:answer_text]).should be_true
    page.has_content?(@user.email).should be_true

    click_link I18n.t('admin.answers.index.back')
    current_path.should == admin_questions_path
  end

  scenario "Delete a question" do
    answer   = Fabricate(:answer)
    question = answer.question

    visit admin_question_answers_path(question_id: question.to_param)

    click_link I18n.t('common.delete')

    current_path.should == admin_question_answers_path(question_id: question.to_param)

    question.reload
    question.answers.count.should == 0
    question.answered.should      be_false
  end
end
