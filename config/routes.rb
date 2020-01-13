Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
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

  resources :cards, only: [:new, :create] 

  resources :purchase, only: [:show] do
    # collection do
      # get "confirmation"
      # get "done"
    #   post "pay"
    # end
  end

  # get 'purchase/confirmation/:id', to: 'purchase#confirmation'
  get 'purchase/done/:id', to: 'purchase#done', as: 'purchase_done'
  post 'purchase/pay/:id', to: 'purchase#pay', as: 'purchase_pay'


  resources :items, only: [:index, :new, :create, :show]

  resources :mypage, only: [:index] do
    collection do
      get "logout"
    end
  end

  resources :users, only: [:destroy]
end
