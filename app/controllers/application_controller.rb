class ApplicationController < ActionController::Base
  include Pagy::Backend

  private

  def authenticate_user!
    if session[:userinfo].blank?
      redirect_to login_url
    end
  end
end
