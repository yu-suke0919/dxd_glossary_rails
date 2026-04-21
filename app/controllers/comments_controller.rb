class CommentsController < ApplicationController
  def create
      @comment
  end
  private
  def comment_params
    params.require(:comment).permit(:title)
  end
end
