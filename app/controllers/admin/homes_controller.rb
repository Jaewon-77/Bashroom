class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!

  def top
    @shoes_reviews = ShoesReview.all
    @users = User.all
    @comment = Comment.all
  end
end
