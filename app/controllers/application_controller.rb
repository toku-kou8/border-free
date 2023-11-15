class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_up_path_for(resource)
    # byebug
    case resource
      when Admin
        admin_contacts_path
    end
  end

  def after_sign_in_path_for(resource)
    # byebug
    case resource
      when Admin
        admin_contacts_path
    end
  end
  
  def configure_permitted_parameters
  end
end
