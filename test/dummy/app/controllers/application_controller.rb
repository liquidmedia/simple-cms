class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :login_as_admin
  #before_filter :login_as_user

  helper_method :current_user, :admin_signed_in?

  helper Ckeditor::Engine.helpers

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
end
