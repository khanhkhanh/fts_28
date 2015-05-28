class Admin::CategoriesController < ApplicationController
  load_and_authorize_resource

  def index
    @categories.paginate page: params[:page],
                         per_page: Settings.page_size
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_params
    if @category.save
      flash[:success] = t :success
      redirect_to admin_categories_path
    else
      render :new
    end
  end

  def edit
    @category = Category.find params[:id]
  end

  def update
    @category = Category.find params[:id]
    if @category.update_attributes category_params
      flash[:success] = t :success
      redirect_to admin_categories_path
    else
      render :edit
    end
  end

  def destroy
    @category = Category.find params[:id]
    if @category.destroy
      flash[:success] = t :success
    else
      flash[:danger] = t :fail
    end
    redirect_to admin_categories_path
  end

  private
  def category_params
    params.require(:category).permit :name
  end
end
