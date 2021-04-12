Rails.application.routes.draw do
  devise_for :users
  root to: 'users#profile'
  get '/users/:id/edit', to: 'users#show_profile',as: 'user_profie'
  put '/user/:id/update', to: 'users#edit_profile', as: 'user_profile_edit'
  get '/user/:id/edit', to: 'users#show_admin_profile', as: 'user_admin_profile_show'
  put '/user/:id/update-admin', to: 'users#edit_admin_profile', as: 'user_admin_profile_edit'
end
