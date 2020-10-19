class ApplicationController < ActionController::Base

  #для добавление строки name
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password)}
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password)}
  end

  
  #вывод ошибок для пользователя
  def render_404
    render file: 'public/404.html', status: 404
  end

end
