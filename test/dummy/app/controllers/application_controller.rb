class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :login_as_admin
  #before_filter :login_as_user
  before_filter :set_locale
  layout :set_layout

  helper_method :current_user, :admin_signed_in?

  def current_user
    session[:current_user]
  end

  def admin_signed_in?
    session[:current_user] && session[:current_user].admin?
  end

  def login_as_admin
    session[:current_user] ||= User.find_or_create_by_name("Test Admin", :admin => true)
  end

  def login_as_user
    session[:current_user] ||= User.find_or_create_by_name("Test User", :admin => false)
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
    Rails.logger.debug "set_locale"
  end

  def set_layout
    Rails.logger.debug "set_layout"
    I18n.locale = :fr
    'application'
  end
end
