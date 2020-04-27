Rails.application.routes.draw do   
   devise_for :users, controllers: { registrations: 'users/registrations' } do 
      resources :posts, controller: posts
   end

   match 'users/:id/destroy' => 'removing#destroy', :via => :delete, :as => :admin_destroy_user
   get '/users/:id', to: 'users_info#show', :as => :users_info
   get '/users', to: 'users_info#all'
   root to: 'application#index'
end
