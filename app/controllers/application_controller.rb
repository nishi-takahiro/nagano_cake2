class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
 
 
  def after_sign_in_path_for(resource)
   public_customers_my_page_path
  end
  
  
 protected
 
 def configure_permitted_parameters
     devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number])
 end
end
