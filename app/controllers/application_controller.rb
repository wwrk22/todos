class ApplicationController < ActionController::Base
  def authenticate
    if signed_in? == false
      redirect_to new_session_path
    end
  end

  def signed_in?
    return session[:current_email].present?
  end
end
