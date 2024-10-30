class PostComment < ApplicationRecord
    
    belongs_to :user
    belongs_to :post_image
    #1:NのN側はbelongs
end
