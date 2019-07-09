Rails.application.routes.draw do
  resources :reviews
  resources :actors
  mount Ckeditor::Engine => '/ckeditor'
  resources :movies
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#index'

  devise_scope :user do
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end
  
  resources :movies do
    member do
      post 'delete_image/:image_id', to: 'movies#delete_image', as: :delete_image_from
      post ':actor_id/addActor', to: 'movies#addActor'
    end

    member do
      post 'add_review', to: 'reviews#add_review', as: :add_review
    end
    
    resources :actors do 
     get 'detach'
    end
  end
end
