$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "ckeditor/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "ckeditor"
  s.version     = Ckeditor::VERSION
  s.authors     = ["Jeremie Wood"]
  s.email       = ["jeremie@jeremiewood.com"]
  s.homepage    = "https://github.com/liquidmedia/simple-cms"
  s.summary     = "A simple CMS using CKEditor for inline editing"
  s.description = "A simple CMS using CKEditor for inline editing"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.6"
  # s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
end
