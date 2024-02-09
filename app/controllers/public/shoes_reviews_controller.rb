class Public::ShoesReviewsController < ApplicationController
  def new
     @shoes_review = ShoesReview.new
  end

  def create
    # @shoes_review = current_user.shoes_reviews.new(shoes_review_params)
    # tags = params[:shoes_review][:tag_id].split(',')
    # if @shoes_review.save
    # #@shoes_reviewをつけることpostモデルの情報を.save_tagsに引き渡してメソッドを走らせることができる
    #   @shoes_review.save_tags(tags)
    #   redirect_to public_homes_top_path, success: t('shoes_reviews.create.create_success')
    # else
    #   render :new
    # end
     @shoes_review = ShoesReview.new(shoes_review_params)
     @shoes_review.user_id = current_user.id
     if @shoes_review.save
       flash[:notice] = "successfully"
       redirect_to public_shoes_review_path(@shoes_review.id)
       #redirect_to request.referer
     else
       flash[:notice] = "error"
       @shoes_reviews = ShoesReview.all
       @user = current_user
       render :index
     end
  end

  def index
     @shoes_reviews = ShoesReview.all
     @user = User.find(current_user.id)
  end

  def edit
    @shoes_review = ShoesReview.find(params[:id])
  end

  def show
    @shoes_review = ShoesReview.find(params[:id])
    @user = @shoes_review.user
    @comment = ShoesReview.new
  end

  def destroy
    @shoes_review = ShoesReview.find(params[:id])
    @shoes_review.destroy
    flash[:notice] = "投稿削除に成功しました。"
    redirect_to public_shoes_reviews_path
  end

  def update
    @shoes_review = ShoesReview.find(params[:id])
    if @shoes_review.update(shoes_review_params)
      flash[:notice] = "successfully"
      redirect_to public_shoes_review_path(@shoes_review.id)
    else
      render :edit
    end
  end

  private

  def shoes_review_params
    params.require(:shoes_review).permit(:title, :review, :traction, :cushion, :fit, :support, :weight, :image)
  end


end
