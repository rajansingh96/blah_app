Rails.application.routes.draw do
  resources :blogs

  get '/hello_world'    => 'application#hello_world'

  get '/list_posts'     => 'application#list_posts'
  get '/show_post/:id' => 'application#show_post'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
