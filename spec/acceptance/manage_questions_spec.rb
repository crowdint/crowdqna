require File.expand_path(File.dirname(__FILE__) + '/acceptance_helper')

feature "Manage Questions", %q{
  In order to provide right feedback
  As a Admin
  I want to Manage the questions
} do

  include Warden::Test::Helpers

  background do
    @user = Fabricate(:user)
    login_as @user
  end

  scenario "Delete a question" do
    question = Fabricate(:question)

    visit '/admin'

    click_link I18n.t('common.delete')

    Question.count.should == 0

    current_path.should == admin_questions_path
  end
end
