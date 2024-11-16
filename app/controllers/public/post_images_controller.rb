class Public::PostImagesController < ApplicationController
  
  def new
    @post_image = PostImage.new
  end
  
  #投稿データの保存
  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    #@post_image(投稿データ)のuser_idを、current_user.id(今ログインしているユーザーの ID)に
    #指定することで投稿データに、今ログイン中のユーザーの ID を持たせることができる
    if @post_image.save
      redirect_to post_images_path
    else
      render :new
    end
  end

  def index
    @post_images = PostImage.page(params[:page])
    #今まではallで全データをとっていたが1ページの決められた数のデータのみ取得する
    #kaminariをインストールしたことで使えるメソッド
  end

  def show
    @post_image = PostImage.find(params[:id])
    @post_comment = PostComment.new
  end
  
  def destroy
    post_image = PostImage.find(params[:id])
    post_image.destroy
    redirect_to post_images_path
    #ここは他ページに遷移しないので@はいらない
  end
  
  private
  
  def post_image_params
    params.require(:post_image).permit(:shop_name, :image, :caption)
  end
  #上記のメソッドはフォームで入力されたデータが投稿データとして
  #許可されているパラメータかチェック
  
end
