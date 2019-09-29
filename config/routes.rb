Rails.application.routes.draw do
  resources :issues
  post 'issues/update' => 'issues#update'
  post 'issues/delete' => 'issues#delete'
end
