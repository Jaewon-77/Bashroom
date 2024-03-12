class Public::HomesController < ApplicationController
  before_action :authenticate_user!, except: [:top, :about]

  def top
    @shoes_reviews = ShoesReview.all.order(created_at: "DESC")
  end

  def about
  end
end
