class CommentsController < ApplicationController
  def create
      @article = Article.find(params[:article_id])
      @comment = @article.comments.new(comment_params)
      @comment.comment_number = 4
      if @comment.save
        redirect_to article_url(@article), notice: "コメントを投稿しました"
      end
  end
  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end
