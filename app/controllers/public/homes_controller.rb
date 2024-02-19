class Public::HomesController < ApplicationController
  before_action :authenticate_user!, except: [:top, :about]
  
  def top
    @shoes_reviews = ShoesReview.all
  end

  def about
  end
end
