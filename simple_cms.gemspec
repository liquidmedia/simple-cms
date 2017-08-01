$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "simple_cms/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "simple_cms"
  s.version     = SimpleCms::VERSION
  s.authors     = ["Jeremie Wood"]
  s.email       = ["jeremie@jeremiewood.com"]
  s.homepage    = "https://github.com/liquidmedia/simple-cms"
  s.summary     = "A simple CMS using CKEditor for inline editing"
  s.description = "A simple CMS using CKEditor for inline editing"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 5.1"
  s.add_dependency "paperclip", "~> 5.1"
  s.add_dependency "aws-sdk", "~> 2"
  s.add_development_dependency "sqlite3"
end
