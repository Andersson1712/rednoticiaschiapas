class MainController < ApplicationController
  def index
 @comments = Comment.all
 @comments = Comment.new
 @articles = Article.all
 @article = Article.new
  end
end
