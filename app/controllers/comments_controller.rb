class CommentsController < ApplicationController
  def create
    @category = Category.find(params[:category_id])
    @comment = @category.comments.create(comment_params)
    redirect_to category_path(@category)
  end

  private
  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end
