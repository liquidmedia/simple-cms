class AddLocaleToPages < ActiveRecord::Migration
  def change
    add_column :simple_cms_pages, :locale, :string
  end
end
