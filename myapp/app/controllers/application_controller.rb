class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    # サインアップ（新規登録）とログイン時に student_id を許可する
    devise_parameter_sanitizer.permit(:sign_up, keys: [:student_id])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:student_id])
  end
end