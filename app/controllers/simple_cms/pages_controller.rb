class SimpleCms::PagesController < ApplicationController

  layout SimpleCms.layout if SimpleCms.layout

  def create
    head '401' and return unless admin_signed_in?
    @full_page = SimpleCms::FullPage.find_or_create_by(name: params[:name], locale: I18n.locale) do |fp|
      fp.title = params[:name].gsub('/', ' ').titleize
      fp.content = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
      fp.full_url = params[:full_url]
    end
    redirect_to main_app.page_path(@full_page.name, :locale => params[:locale])
  end

  def show
    head '404' and return unless params[:format].blank? || params[:format] == "html"

    @full_page = SimpleCms::FullPage.where(name: params[:name], locale: I18n.locale).first
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
    params.permit!
    @page.update(params[:page])
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