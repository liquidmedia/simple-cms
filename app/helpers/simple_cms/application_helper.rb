module SimpleCms
  module ApplicationHelper

    def page_fragment(name, user = nil, tag_name = :div, default_text = "This text block is blank. Click on it to edit it and add content.")
      @page = Page.find_or_create_by_name_and_locale(name, I18n.locale, :url => request.path[1..-1], :full_url => request.url)
      @page.update_attributes(:url => request.path[1..-1]) if @page.url.nil?
      @page.users << user unless user.nil? || @page.users.include?(user)

      content = @page.content
      return '' if content.blank? && !(admin_signed_in? || @page.editable?(current_user))
      content = default_text if content.blank?

      content_tag :div, :class => :page_fragment do
        content_tag tag_name, :class => :editable_area, :id => "page_fragment_#{@page.id}", :"data-id" => @page.id do
          content.html_safe
        end.concat(simple_cms_edit_button(@page.editable?(current_user)))
      end
    end

    def simple_cms_edit_button(editable)
      admin_signed_in? || editable ? '<div class="edit_button">edit</div>'.html_safe : ''
    end
  end
end
