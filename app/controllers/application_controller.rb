class ApplicationController < ActionController::Base
    before_action :authenticate_user!, except: [:top]
    #ログインやユーザ登録の前にconfigure_permitted_parameter（パラメーターを取得）が使われる
    before_action :configure_permitted_parameters, if: :devise_controller?
    
    def after_sign_in_path_for(resources)
        post_images_path
    end
    
    def after_sign_out_path_for(resources)
        about_path
    end
    
    protected
    
    #devise_parameter_sanitizer.permitメソッドを使うことでユーザー登録(sign_up)の際に、ユーザー名(name)のデータ操作を許可しています
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    end
end
#comfirm