Rails.application.routes.draw do
    root 'emotions#index'
    
    get '/login', to: redirect('/auth/google_oauth2')
    get '/logout' => 'sessions#destroy', :as => :logout
    get "/auth/:provider/callback" => "sessions#create"
    
    resources :emotions
end
