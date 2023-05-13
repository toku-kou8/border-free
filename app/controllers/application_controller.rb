class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_up_path_for(resource)
    # byebug
    case resource
      when Teacher
        teacher_top_path
      when :student
        root_path
      when :admin
        root_path
    end
  end

  def after_sign_inresour_path_for(resource)
    byebug
    case resource
      when Teacher
        teacher_top_path
      when :student
        root_path
      when :admin
        root_path
    end
  end

  def after_sign_out_path_for(resource)
    case resource
      when :teacher
        root_path
      when :student
        root_path
      when :admin
        root_path
    end
  end

  def configure_permitted_parameters
    if resource_class == Teacher
      devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :name, :name_kana, :phone_number, :school, :faculty, :birth])
    elsif resource_class == Student
      devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :name, :name_kana, :phone_number, :parent_name, :parent_name_kana, :birth])

    end
  end
end
