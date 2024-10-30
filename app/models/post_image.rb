class PostImage < ApplicationRecord
    
    has_one_attached :image
    belongs_to :user
    #1:N　N側（ユーザー1人に対しポストは何投稿もできる
    has_many :post_comments, dependent: :destroy
    has_many :favorites, dependent: :destroy
    
    validates :shop_name, presence: true
    validates :image, presence: true
    
    def favorited_by?(user)
        favorites.exists?(user_id: user.id)
    end
    #favrited_byメソッド引数で渡されたユーザーidがfavoriteテーブル内に存在するかどうか調べる存在していればtrueなければfalse
    
    #get_imageメゾットで画像を表示させる（設定なしならno_imageありならimageを持ってくる
    def get_image
        unless image.attached?
            file_path = Rails.root.join('app/assets/images/no_image.jpg')
            image.attach(io: File.open(file_path), filename: 'default-image.jpeg', content_type: 'image/jpeg')
        end
            image
    end
end
