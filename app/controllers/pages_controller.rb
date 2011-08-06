class PagesController < ApplicationController
  def index
    if signed_in?
      @question = Question.new
      @feed_items = Question.page params[:page]
    end
  end
end
