Rails.application.routes.draw do

  resources :bloggers
  resources :destinations
  resources :posts

  get '/like_button', to: 'posts#like_button',  as: 'like_button'
  #get '/dislike_button', to: 'posts#dislike_button',  as: 'dislike_button'

end
