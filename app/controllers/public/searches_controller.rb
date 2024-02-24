class Public::SearchesController < ApplicationController
  def search
    @range = params[:range]
    @word = params[:word]

    if @range == "Nickname"
      @users = User.looks(params[:search], params[:word])
    else
      @shoes_reviews = ShoesReview.looks(params[:search], params[:word])
    end
  end
end
