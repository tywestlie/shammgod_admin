class ArticlesController < ApplicationController

  def show
    @article = Article.find_by_id(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    article = current_user.articles.create(article_params)
    article.save
    redirect_to dashboard_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end
end
