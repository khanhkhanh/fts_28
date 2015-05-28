class QuestionsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!

  def index
    @questions = @questions.paginate page: params[:page],
                                     per_page: Settings.page_size
  end
end
