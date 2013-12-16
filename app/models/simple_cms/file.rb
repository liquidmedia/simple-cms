class SimpleCms::File < ActiveRecord::Base

  self.table_name = 'simple_cms_files'

  attr_accessible :upload

  has_attached_file :upload, styles: {
      :thumb => "100x100>"
  }

end