Rails.application.routes.draw do
  get 'me', to: 'intros#me'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
