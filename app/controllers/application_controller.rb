class ApplicationController < ActionController::Base
    before_action :authenticate_user!, except: [:top], unless: :admin_controller?
    #ログインやユーザ登録の前にconfigure_permitted_parameter（パラメーターを取得）が使われる
    
    private
 
    def admin_controller?
        self.class.module_parent_name == 'Admin'
    end
        
    
end
