Rails.application.routes.draw do
  resources :actors
  mount Ckeditor::Engine => '/ckeditor'
  resources :movies
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#index'
  post 'movies/:movie_id/:actor_id/addActor', to: 'movies#addActor'

  devise_scope :user do
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end
  
  resources :movies do
    member do
      post 'delete_image/:image_id', to: 'movies#delete_image', as: :delete_image_from
    end

    resources :actors do 
     get 'detach'
    end
  end
end
