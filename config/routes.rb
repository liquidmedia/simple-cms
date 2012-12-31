Rails.application.routes.draw do

  namespace :simple_cms do
    get '/admin' => 'admin#index'
    post '/create' => 'pages#create'
    post '/:id' => 'pages#update'
    delete '/:id' => 'pages#delete'
  end

  get '/*name' => 'simple_cms/pages#show', :as => :page
end
