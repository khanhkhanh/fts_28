class CategoriesController < ApplicationController
  load_and_authorize_resource

  def index
    @categories.paginate page: params[:page],
                         per_page: Settings.page_size
  end
end
