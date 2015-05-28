class QuestionsController < ApplicationController
  load_and_authorize_resource

  def index
    @questions.paginate page: params[:page],
                        per_page: Settings.page_size
  end
end
