class CreatePostImages < ActiveRecord::Migration[6.1]
  def change
    create_table :post_images do |t|
      t.string :shop_name
      t.text :caption      
      t.integer :user_id
      #投稿画像に必要な店名、画像の説明、投稿ユーザー識別IDを追加してrails db :migrate
      t.timestamps
    end
  end
end
