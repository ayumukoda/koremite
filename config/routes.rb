Rails.application.routes.draw do
  devise_for :users
  #devise_for :usersはdevise を使用する際に URL として users を含むことを示している:
  root to: "homes#top"
  #get 'homes/top'はデフォルトこれは消してroot toを使う
  get 'homes/about' => 'homes#about', as: 'about'
  #名前付きルートをaboutに設定
  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
    resource :favorite, onlt:[:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end
  #コメントは投稿画像に結び付くのでこのような親子関係にする(ネストするという)
  resources :users, only: [:show, :edit, :update]
 
end
