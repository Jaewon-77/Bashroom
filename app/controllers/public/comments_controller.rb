class Public::CommentsController < ApplicationController
  
  def create
    shoes_review = ShoesReview.find(params[:shoes_review_id])
    comment_post = current_user.comments.new(comment_params)
    comment_post.shoes_review_id = shoes_review.id
    comment_post.save
    redirect_to public_shoes_review_path(shoes_review)
  end
  
  def destroy
    Comment.find(params[:id]).destroy
    redirect_to public_shoes_review_path(params[:shoes_review_id])
  end
  
  
  

  private

  def comment_params
    params.require(:comment).permit(:comment_post)
  end

  
  
end
