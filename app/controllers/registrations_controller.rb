class RegistrationsController < Devise::RegistrationsController
  before_action :have_user
  before_filter :configure_permitted_parameters



  def have_user
    if User.first.present?
      redirect_to root_path
    end
  end  

    protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up).push(:admin)
  end


end 