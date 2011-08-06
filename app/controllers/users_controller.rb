class UsersController < ApplicationController
  before_filter :authenticate_user!, :only => [:index, :edit, :update]
  
  def index
    @users = User.page params[:page]
  end

  def create
  end

  def new
  end

  def edit
  end

  def show
    @questions = current_user.questions.page params[:page]
  end

  def update
    if current_user.update_attributes(params[:user])
      flash[:success] = "Profile updated."
      redirect_to current_user
    else
      render 'edit'
    end
  end

  def destroy
    current_user.destroy
    flash[:success] = "User destroyed."
    redirect_to users_path
  end

end
