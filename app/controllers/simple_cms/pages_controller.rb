class SimpleCms::PagesController < ApplicationController

  layout SimpleCms.layout if SimpleCms.layout

  def create
    head '401' and return unless admin_signed_in?
    @full_page = SimpleCms::FullPage.find_or_create_by_name_and_locale(params[:name], I18n.locale, :title => params[:name].gsub('/', ' ').titleize, :content => "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", :full_url => params[:full_url])
    redirect_to main_app.page_path(@full_page.name, :locale => params[:locale])
  end

  def show
    head '404' and return unless params[:format].blank? || params[:format] == "html"

    @full_page = SimpleCms::FullPage.find_by_name_and_locale(params[:name], I18n.locale)
    if @full_page.nil?
      if admin_signed_in?
        render 'simple_cms/pages/new'
      else
        head '404' and return
      end
    end
  end

  def update
    @page = SimpleCms::Page.find(params[:id])
    head '401' and return unless admin_signed_in? || @page.editable?(current_user)
    @page.update_attributes(params[:page])
    head '200'
  end

  def delete
    head '401' and return unless admin_signed_in?
    @page = SimpleCms::Page.find(params[:id])
    @page.destroy
    redirect_to simple_cms_admin_path, notice: "Page deleted"
  end

  private

  def error_msg
    "(No route matches [GET] \"#{request.path}\")"
  end
end