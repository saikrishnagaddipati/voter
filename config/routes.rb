Rails.application.routes.draw do
  resources :comments
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :links do 
  	member do 
  		put "like", to: "links#upvote"
  		put "dislike", to: "links#downvote"
  	end
    resources :comments
  end
  root to: "links#index"
  #HTTP POST method is used to prevent showing params in the data in the URL.
  post 'downloads/download' => 'downloads#download', as: :download
  post 'downloads/show_options' => 'downloads#show_options', as: :show_options
  post 'downloads/hide_options' => 'downloads#hide_options', as: :hide_options
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
