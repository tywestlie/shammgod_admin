class ArticlesController < ApplicationController
  def show
    @article = Article.find_by_id(params[:format])
  end
end
