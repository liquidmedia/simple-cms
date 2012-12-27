Rails.application.routes.draw do

  root :to => "home#index"

  match "/testpage1" => "home#testpage1"
  match "/testpage2" => "home#testpage2"

end
