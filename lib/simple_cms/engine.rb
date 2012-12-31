module SimpleCms
  class Engine < ::Rails::Engine
    engine_name 'simple_cms'

    #initializer "simple_cms.assets_precompile" do |app|
    #  app.config.assets.precompile += SimpleCms.assets
    #end

    initializer "static assets" do |app|
      app.middleware.use ::ActionDispatch::Static, "#{root}/vendor/assets"
    end
  end
end
