module SimpleCms
  class Engine < ::Rails::Engine
    engine_name 'simple_cms'

    initializer "simple_cms.assets_precompile" do |app|
      app.config.assets.precompile += SimpleCms.assets
    end
  end
end
