require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  protect_from_forgery with: :exception

  respond_to :html
  layout :set_layout

  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :load_color

  # optional just for fun
  helper_method :current_hit

  def current_hit
    hit = cookies['hit'].to_i
    hit += 1
    cookies['hit'] = hit
    hit
  end

  def load_color
    @color = %w(pink red purple deep-purple indigo blue light-blue cyan teal green light-green lime yellow amber orange deep-orange brown grey).sample
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, { team_attributes:[:name] }])
  end

  def set_layout
    if user_signed_in?
      "application"
    else
      devise_controller? ? "login" : "application"
    end
  end

end
