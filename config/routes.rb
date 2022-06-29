Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get "/index", to: "pages#index"

  get "/calculate", to: "pages#calculate"
  #post "/calculate", to: "pages#calculate"

end
