class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?


  def after_sign_in_path_for(resource)
    top_path # ログアウト後に遷移するpathを設定
  end


  def after_sign_out_path_for(resource)
    top_path # ログアウト後に遷移するpathを設定
  end

    private

    # def user_signed_in
    	
    # 	@user = current_user
    # 	@username = current_user.user_name
    # end
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
    	user_params.permit(:user_name, :password, :password_confirmation, :email)
  	end
    devise_parameter_sanitizer.permit(:sign_in) do |user_params|
    	user_params.permit(:username, :password, :remember_me, :email)
  	end
  end
end
