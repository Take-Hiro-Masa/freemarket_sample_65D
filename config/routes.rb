Rails.application.routes.draw do
  devise_for :users
  root "items#index"
  resources :signup, only: [:index, :create] do
    collection do
      get "step2"
      get "step3"
      get "step4"
      get "step5" 
      get "step6"  
    end
  end

  resources :cards, only: [:new, :create] do
    collection do
      post "show"
      post "delete"
    end
  end

  resources :purchase, only: [:create] do
    member do
      get "confirmation"
      get "done"
      post "pay"
    end
  end


  resources :items

  resources :mypage, only: [:index] do
    collection do
      get "logout"
    end
  end

  resources :users, only: [:destroy]
end
