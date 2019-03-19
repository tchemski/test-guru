Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'tests#index'

  resources :tests, param: :test_id do

    get :beginner, on: :collection

    member do
      post :start
      resources :questions, shallow: true, param: :question_id
    end
  end
end
