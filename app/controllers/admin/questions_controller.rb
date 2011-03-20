class Admin::QuestionsController < Admin::BaseController
  inherit_resources

  def collection
    @questions ||= end_of_association_chain.descending(:created_at)
  end
end
