# This migration comes from simple_cms (originally 20130228170011)
class AddLocaleToPages < ActiveRecord::Migration[4.2]
  def change
    add_column :simple_cms_pages, :locale, :string
  end
end
