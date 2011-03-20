require File.expand_path(File.dirname(__FILE__) + '/acceptance_helper')

feature "Post Questions", %q{
  In order to get Feedback
  As a User
  I want to post and read questions
} do

  include Warden::Test::Helpers

  background do
    @user = Fabricate(:user)
    login_as @user
  end

  scenario "Post a question" do
    question_attributes = Fabricate.attributes_for(:question)

    visit '/'
    click_link 'Post a question'

    fill_in 'Question', with: question_attributes[:question_text]
    click_button 'Submit'

    Question.count.should == 1
    question = Question.last
    question.question_text.should == question_attributes[:question_text]

    current_path.should == questions_path
  end

  scenario "Question index page only shows answered questions" do
    answer   = Fabricate(:answer)
    question = answer.question

    unanswered_question = Fabricate(:question)

    visit questions_path

    page.has_content?(question.question_text).should be_true
    page.has_content?(answer.answer_text).should be_true
    page.has_content?(answer.author_email).should be_true

    page.has_content?(unanswered_question.question_text).should be_false
  end
end
