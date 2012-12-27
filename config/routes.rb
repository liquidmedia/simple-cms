Rails.application.routes.draw do

  namespace :ckeditor do
    get '/admin' => 'admin#index'
    post '/create' => 'pages#create'
    post '/:id' => 'pages#update'
    delete '/:id' => 'pages#delete'
  end

  get '/*name' => 'ckeditor/pages#show', :as => :page
end
