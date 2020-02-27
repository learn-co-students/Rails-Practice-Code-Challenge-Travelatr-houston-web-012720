Rails.application.routes.draw do
  resources :bloggers
  resources :destinations
  resources :posts
  get '/posts/:id/like', to: 'posts#like', as: 'like_post'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
