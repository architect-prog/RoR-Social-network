Rails.application.routes.draw do
   devise_for :users, controllers: { registrations: 'users/registrations' }
   get '/users/:id', to: 'users_info#show'
   get '/users', to: 'users_info#all'
   match 'users/:id/destroy' => 'removing#destroy', :via => :delete, :as => :admin_destroy_user
   root to: 'application#index'
end
