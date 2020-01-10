Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "items#index"
  resources :signup, only: [:index, :create] do
    collection do
      get "step1"
      get "step2"
      get "step3"
      get "step4"
      get "step5" 
      get "step6"  
    end
  end

  resources :items, only: [:index, :new, :create, :show]

  resources :mypage, only: [:index] do
    collection do
      get "logout"
    end
  end

  resources :users, only: [:destroy]
end
