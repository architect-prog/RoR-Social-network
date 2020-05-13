Rails.application.routes.draw do 

   root to: 'application#index'
   get '/users', to: 'users#all'    

   devise_for :users, controllers: { registrations: 'users/registrations' }

   resources :users, only: [:show, :destroy] do
      resources :posts
   end
  
   
   
   
end
