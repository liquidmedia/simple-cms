# desc "Explaining what the task does"
# task :simple_cms do
#   # Task goes here
# end

# We copy over the ckeditor folder because this allows the ckeditor javascript to reference uncompiled assets
Rake::Task["assets:precompile"].enhance do
  Rake::Task["simple_cms:copy_assets"].invoke
end

namespace :simple_cms do
  task :copy_assets => :"assets:environment"  do
    source_file = File.join(SimpleCms::Engine.root, 'vendor', 'assets', 'javascripts', 'ckeditor')
    dest_file = File.join(Rails.root, 'public')
    FileUtils.cp_r source_file, dest_file
  end
end