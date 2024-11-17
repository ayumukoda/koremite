class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_one_attached :profile_image
  #profile_imageという名前でacttivestorageでプロフィール画像を保存できるように設定
  has_many :post_images, dependent: :destroy
  #1:Nの関係　Userモデルは１の側（ポストに対してユーザーは一人のみ
  has_many :post_comments, dependent: :destroy
  #userモデルとpost_commentモデルを関連付ける
  has_many :favorites, dependent: :destroy
  
  def get_profile_image(width,height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
      #メソッドの内容は画像が設定されない場合no_image.jpgをデフォルト画像で表示させるというもの
    end
    profile_image.variant(resize_to_limit: [width,height]).processed
  end
  
  def self.looks(search, word)
    if search == "perfect_match"
      @user = User.where("name LIKE?", "#{word}")
    elsif search == "forward_match"
      @user = User.where("name LIKE?","#{word}%")
    elsif search == "backward_match"
      @user = User.where("name LIKE?","%#{word}")
    elsif search == "partial_match"
      @user = User.where("name LIKE?","%#{word}%")
    else
      @user = User.all
    end
  end
  
end
