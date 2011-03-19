class QuestionsController < ApplicationController
  before_filter :authenticate_user!

  inherit_resources

  def create
    create! do |format|
      format.html { redirect_to questions_path }
    end
  end
end
