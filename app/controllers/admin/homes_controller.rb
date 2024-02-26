class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!

  def top
    @shoes_reviews = ShoesReview.all.order(created_at: "DESC")
    @users = User.all.order(created_at: "DESC")
    @comment = Comment.all
  end
end
