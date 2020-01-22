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


  resources :items do
    member do
      patch "suspension"
    end
  end

  resources :mypage, only: [:index] do
    collection do
      get "logout"
      get "user_edit"
      get "profile"
    end
  end

  resources :users, only: [:destroy]
end
