class Admin::ReviewCommentsController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @comments = Comment.all
    @users = User.all
  end

  def destroy
    @review_comment = Comment.find(params[:id])
    @review_comment.destroy
    redirect_to admin_review_comments_path
  end

end
