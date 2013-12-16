Rails.application.routes.draw do

  namespace :simple_cms do
    get '/admin' => 'admin#index'
    post '/create' => 'pages#create'
    post '/:id' => 'pages#update'
    delete '/:id' => 'pages#delete'
    get '/files/browse' => 'files#browse'
    post '/files/upload' => 'files#upload'
  end

  get '/*name' => 'simple_cms/pages#show', :as => :page
end
