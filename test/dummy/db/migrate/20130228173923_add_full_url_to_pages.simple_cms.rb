# This migration comes from simple_cms (originally 20130228173846)
class AddFullUrlToPages < ActiveRecord::Migration
  def change
    add_column :simple_cms_pages, :full_url, :string
  end
end
