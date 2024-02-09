class Public::HomesController < ApplicationController
  def top
    @shoes_reviews = ShoesReview.all
  end

  def about
  end
end
