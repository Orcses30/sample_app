class QuestionsController < ApplicationController
  helper_method :sort_column, :sort_direction
  def index
    @questions = Question.all.order(sort_column + ' ' + sort_direction).paginate(page: params[:page])
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def edit
    @question = Question.find(params[:id])
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:success] = "question created"
      redirect_to questions_path
    else
      render 'new'
    end
  end

  def update
    @question = Question.find(params[:id])
    if @question.update_attributes(question_params)
      flash[:success] = "Question updated"
      redirect_to @question
    else
      render 'edit'
    end
  end

  def destroy
    Question.find(params[:id]).destroy
    flash[:success] = "Question deleted"
    redirect_to questions_url
  end

  private
    def question_params
      params.require(:question).permit(:cfp_class, :question, :answer)
    end

    def sort_column
      Question.column_names.include?(params[:sort]) ? params[:sort] : "question"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction])? params[:direction] : "asc"
    end
end
