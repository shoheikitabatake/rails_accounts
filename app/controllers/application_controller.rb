class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :authenticate_user!, unless: :devise_controller?

  def is_invalid_user? ( valid_user_id )
    return current_user.id.to_i != valid_user_id.to_i
  end
end
