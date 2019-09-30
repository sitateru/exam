Rails.application.routes.draw do
  resources :issues
  put 'issues/:id' => 'issues#update'
  delete 'issues/:id' => 'issues#delete'
end
