require "simple_cms/engine"
require 'paperclip'
require 'aws-sdk'

module SimpleCms
  mattr_accessor :layout # no default, used only if user sets a value

  def self.assets
    %w( simple_cms/file_browser.js simple_cms/file_browser.css simple_cms/file_icons/* simple_cms/icons/* )
  end

  def self.root_path
    @root_path ||= Pathname.new( File.dirname(File.expand_path('../', __FILE__)) )
  end
end
