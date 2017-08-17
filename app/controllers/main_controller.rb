class MainController < ApplicationController
  def index
 @comments = Comment.all
 @comments = Comment.new
 @articles = Article.paginate(page: params[:page],per_page:6).ultimos
 @article = Article.new
  end
end
