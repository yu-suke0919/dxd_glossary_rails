class CommentsController < ApplicationController
  def create
      @article = Article.find(params[:article_id])
      @comment = Comment.new(comment_params)
      @comment.save!
      redirect_to articles_url(@article), notice: "コメントを投稿しました"
  end
  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end
