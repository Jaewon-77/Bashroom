class Public::SearchesController < ApplicationController
  def search
    @range = params[:range]
    @word = params[:word]

    if @range == "User"
      @users = User.looks(params[:search], params[:word])
    else
      @shoes_review = ShoesReview.looks(params[:search], params[:word])
    end
  end
end
