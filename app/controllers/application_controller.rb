class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  ####before_action :authenticate_customer!, except:[:top,:about]
  def after_sign_out_path_for(resource)
    if resource == :admin
      admin_session_path
    elsif resource == :customer
      customer_session_path
    else
      about_path
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana,
                                                                         :postal_code, :address, :telephone_number])
  end
end
