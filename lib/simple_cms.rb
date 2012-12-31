require "simple_cms/engine"

module SimpleCms
  mattr_accessor :layout
  self.layout = 'application'

  #def self.assets
  #  asset_list = Dir[root.join('vendor/assets/javascripts/ckeditor/**', '*.{js,css}')].inject([]) do |list, path|
  #    list << Pathname.new(path).relative_path_from(root_path.join('vendor/assets/javascripts'))
  #  end
  #  asset_list
  #end
end
