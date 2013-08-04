Preunion::Application.routes.draw do

  post "/missions/:id/:action_name",
    :to => 'missions#perform_action',
    :as => :mission_perform_action

  resources :missions


  delete 'session', to: 'session#destroy', as: :sign_out
  get '/auth/github/callback', to: 'session#auth'
  root to: 'home#index'

end
