Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    resources :users do
      collection do
        post 'login', to: 'users#login'
        post 'register', to: 'users#register'
        get 'test', to: 'users#test'
      end
    end
  end

  namespace :admin do
    resources :admin

    resources :film do
      member do
        get 'crawl', to: 'film#crawl'
      end
    end

  end

end
