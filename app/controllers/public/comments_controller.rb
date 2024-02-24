class Public::CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    shoes_review = ShoesReview.find(params[:shoes_review_id])
    comment_post = current_user.comments.new(comment_params)
    comment_post.shoes_review_id = shoes_review.id
    if comment_post.save
      flash[:notice] = "コメント投稿が完了しました。"
      redirect_to public_shoes_review_path(shoes_review)
    else
      flash[:notice] = "コメント投稿が失敗しました。"
      redirect_to public_shoes_review_path(shoes_review)
    end


  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to public_shoes_review_path(params[:shoes_review_id]), notice: 'コメントを削除しました。'
  end

  private

  def comment_params
    params.require(:shoes_review).permit(:user_comment)
  end

end
