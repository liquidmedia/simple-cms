class SimpleCms::AdminController < ApplicationController

  before_action :check_authorization

  def index
    @grouped_pages = SimpleCms::Page.where(:type => nil).order(:url, :name).group_by{|page| page.url}
    @full_pages = SimpleCms::FullPage.order(:name)
  end

  private

  def check_authorization
    unless admin_signed_in?
      redirect_to main_app.root_path, alert: "Access Denied"
      return false
    end
  end
end