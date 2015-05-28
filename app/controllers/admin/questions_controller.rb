class Admin::QuestionsController < ApplicationController
  load_and_authorize_resource

  def index
    @questions.paginate page: params[:page],
                        per_page: Settings.page_size
  end

  def new
    @question = Question.new
    @categories = Category.all
    4.times {@question.answers.build}
  end

  def create
    @question = Question.new question_params
    if @question.save
      flash[:success] = t :success
      redirect_to admin_questions_path
    else
      @categories = Category.all
      render :new
    end
  end

  def edit
    @question = Question.find params[:id]
    @categories = Category.all
  end

  def update
    @question = Question.find params[:id]
    if @question.update_attributes question_params
      flash[:success] = t :success
      redirect_to admin_questions_path
    else
      @categories = Category.all
      render :edit
    end
  end

  def destroy
    @question = Question.find params[:id]
    if @question.destroy
      flash[:success] = t :success
    else
      flash[:danger] = t :fail
    end
    redirect_to admin_questions_path
  end

  private
  def question_params
    params.require(:question).permit :content, :category_id,
      answers_attributes: [:id, :content, :correct, :_destroy]
  end
end
