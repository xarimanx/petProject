class AnswersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :authorized_user, :only => :destroy
  
  def index
    question = Question.find(params[:question_id])
    @feed_items = question.answers.page params[:page]
  end

  def new
    @answer = Answer.new
    @question = Question.find(params[:question_id])
  end

  def create
    question = Question.find(params[:question][:id])
    @answer = question.answers.build(:user_id => current_user.id, :content => params[:answer][:content])
    if @answer.save
      flash[:success] = "Answer created!"
      redirect_to root_path
    else
      render 'pages/index'
    end
  end

  def edit
  end

  def show    
  end

  def update
  end

  def destroy
    @answer.destroy
    redirect_back_or root_path
  end
  
  private

  def authorized_user
    @answer = current_user.answers.find_by_id(params[:id])
    redirect_to root_path if @answer.nil?
  end

end
