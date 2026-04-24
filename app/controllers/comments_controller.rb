class CommentsController < ApplicationController
  before_action :current_user
  def create
    @article = Article.find(params[:article_id])
    @comment = Comments::CreateService.new.call(article: @article, user: @current_user, params: comment_params)
    if @comment.persisted?
      redirect_to article_url(@article), notice: "コメントを投稿しました"
    else
      render "articles/show", status: :unprocessable_entity
    end
  end
  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end
