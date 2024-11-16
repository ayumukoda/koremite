class Public::PostCommentsController < ApplicationController
    
    def create
        post_image = PostImage.find(params[:post_image_id])
        comment = current_user.post_comments.new(post_comment_params)
        #comment = PostComment.new(post_commet_params)
        #comment.user_id = current_user.id
        #この形の省略形が上の一行にまとまっている
        comment.post_image_id = post_image.id
        comment.save
        redirect_to post_image_path(post_image)
        #post_images/:idのページに飛ぶように設定
    end
    
    def destroy
        PostComment.find(params[:id]).destroy
        redirect_to post_image_path(params[:post_image_id])
    end
    
    private
    
    def post_comment_params
        params.require(:post_comment).permit(:comment)
    end
end
#comfirm