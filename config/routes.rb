Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "postcode_checks#home"
  get '/check', to: "postcode_checks#result"
end
