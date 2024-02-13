class Admin::HomesController < ApplicationController
  def top
    @shoes_reviews = ShoesReview.all
    @users = User.all
    @comment = Comment.all
  end
end
