require "simple_cms/engine"
require 'paperclip'
require 'aws-sdk'

module SimpleCms
  mattr_accessor :layout # no default, used only if user sets a value

  def self.assets
    asset_list = Dir[SimpleCms.root_path.join('vendor/assets/javascripts/ckeditor/**', '*.{js,css}')].inject([]) do |list, path|
      list << Pathname.new(path).relative_path_from(SimpleCms.root_path.join('vendor/assets/javascripts')).to_s
    end
    asset_list << 'simple_cms/file_browser.js' << 'simple_cms/file_browser.css'
  end

  def self.root_path
    @root_path ||= Pathname.new( File.dirname(File.expand_path('../', __FILE__)) )
  end
end
