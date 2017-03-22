class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protect_from_forgery with: :exception



protected

# Deviseのストロングパラメータを追加する
def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  devise_parameter_sanitizer.permit(:account_update, keys: [:nickname])
end

end
