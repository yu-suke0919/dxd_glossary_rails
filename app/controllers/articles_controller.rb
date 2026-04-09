class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    article = Article.new(article_params)
    article.save!
    redirect_to articles_url, notice: "「#{article.title}」を登録しました"
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    article = Article.find(params[:id])
    article.update!(article_params)
    redirect_to articles_url, notice: "#{article.title}を更新しました"
  end

  private
  def article_params
    params.require(:article).permit(:title, :category, :description)
  end
end
