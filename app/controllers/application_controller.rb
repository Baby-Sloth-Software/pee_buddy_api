class ApplicationController < ActionController::API
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  helper_method :current_user

  def current_user
    token = request.headers["X-BSS-PeeBuddy"]
    token && User.find_by!(auth_token: token)
  end

  def authenticate_user!
    unless current_user
      token = request.headers["X-BSS-PeeBuddy"]
      render json: { error: "Could not authenticate with X-BSS-PeeBuddy token:'#{token}'" },
             status: :unauthorized
    end
  end

  rescue_from ActiveRecord::RecordNotFound do |error|
    render json: { errors: "Object not found: #{error.message}" }, status: :not_found
  end
end
