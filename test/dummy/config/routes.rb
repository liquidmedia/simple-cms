Rails.application.routes.draw do

  root :to => "home#index"

  get "/testpage1" => "home#testpage1"
  get "/testpage2" => "home#testpage2"

end
