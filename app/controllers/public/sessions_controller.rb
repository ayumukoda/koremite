# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
    before_action :configure_permitted_parameters, if: :devise_controller?
    # before_action :configure_sign_in_params, only: [:create]
    def after_sign_in_path_for(resources)
        post_images_path
    end
    
    def after_sign_out_path_for(resources)
        about_path
    end

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  protected
    
    #devise_parameter_sanitizer.permitメソッドを使うことでユーザー登録(sign_up)の際に、ユーザー名(name)のデータ操作を許可しています
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    end
end
