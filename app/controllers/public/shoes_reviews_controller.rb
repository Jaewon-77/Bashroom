class Public::ShoesReviewsController < ApplicationController
  def new
     @shoes_review = ShoesReview.new
  end

  def create
     @shoes_review = ShoesReview.new(shoes_review_params)
     #@shoes_review.end_user_id = current_user.id
     #@shoes_review.id = current_user.id
     @shoes_review.user_id = current_user.id
     tag_list = params[:shoes_review][:name].split(',')#追加
     if @shoes_review.save
       @shoes_review.save_tags(tag_list)#追加
       flash[:notice] = "投稿が完了しました。"
       redirect_to public_shoes_review_path(@shoes_review.id)
       #redirect_to request.referer
     else
       flash[:notice] = "投稿が失敗しました。"
       @shoes_reviews = ShoesReview.all
       @user = current_user
       render :new
     end
  end

  def index
     @shoes_reviews = ShoesReview.page(params[:page])
     #@shoes_reviews = ShoesReview.all
     @user = User.find(current_user.id)
     @tag_list = Tag.all

  end

  def edit
    @shoes_review = ShoesReview.find(params[:id])
    @tag_list = @shoes_review.tags.pluck(:name).join(',')
  end

  def show
    @shoes_review = ShoesReview.find(params[:id])
    @user = @shoes_review.user
    @comment = ShoesReview.new
    @tag_list = @shoes_review.tags.pluck(:name).join(',')
    @shoes_review_tags = @shoes_review.tags
  end

  def destroy
    @shoes_review = ShoesReview.find(params[:id])
    @shoes_review.destroy
    flash[:notice] = "投稿削除に成功しました。"
    redirect_to public_shoes_reviews_path
  end

  def update
    @shoes_review = ShoesReview.find(params[:id])
    tag_list=params[:shoes_review][:name].split(',')#
    if @shoes_review.update(shoes_review_params)
      @shoes_review.save_tags(tag_list)
      flash[:notice] = "変更内容を保存しました。"
      redirect_to public_shoes_review_path(@shoes_review.id)
    else
      flash[:notice] = "変更内容を保存できませんでした。"
      render :edit
    end
  end

  def search_tag
    #検索結果画面でもタグ一覧表示
    @tag_list = Tag.all
     #検索されたタグを受け取る
    @tag = Tag.find(params[:tag_id])
     #検索されたタグに紐づく投稿を表示
    @shoes_reviews = @tag.shoes_reviews
  end



  private

  def shoes_review_params
    params.require(:shoes_review).permit(:title, :review, :traction, :cushion, :fit, :support, :weight, :image)
  end


end
