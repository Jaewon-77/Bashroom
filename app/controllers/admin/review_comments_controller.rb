class Admin::ReviewCommentsController < ApplicationController
  
  def index
    @comments = Comment.all
    @users = User.all
  end

  def destroy
    @review_comment = ReviewComment.find(params[:id])
    @review_comment.destroy
    redirect_to admin_review_comments_path
  end
  
end
