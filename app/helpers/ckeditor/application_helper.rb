module Ckeditor
  module ApplicationHelper

    def page_fragment(name, user=nil)
      @page = Page.find_or_create_by_name(name, :url => request.path[1..-1])
      @page.update_attributes(:url => request.path[1..-1]) if @page.url.nil?
      @page.users << user unless user.nil? || @page.users.include?(user)

      content = @page.content
      return '' if content.blank? && !(admin_signed_in? || @page.editable?(current_user))
      content = "This text block is blank. Click on it to edit it and add content." if content.blank?

      content_tag :div, :class => :page_fragment, :id => "page_fragment_#{@page.id}", :"data-id" => @page.id, :contenteditable => (admin_signed_in? || @page.editable?(current_user)).to_s do
        content.html_safe
      end
    end
  end
end
