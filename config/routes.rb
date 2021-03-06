Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, except: [:new  ]
   get 'signup', to: 'users#new'
   get 'welcomeNewCustomer', to: 'users#newCustomer'
   get 'projects', to: 'projects#new'
   post 'projects', to: 'projects#create'
end
