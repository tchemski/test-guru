Rails.application.routes.draw do
  root to: 'tests#index'

  get :signup, to: 'users#new'

  resources :users, only: :create

  resources :tests, param: :test_id do
    member do
      post :start
      resources :questions, shallow: true, param: :question_id, except: :index do
        member do
          resources :answers, shallow: true, param: :answer_id, except: :index
        end
      end
    end
  end

  resources :tests_passages, param: :tests_passage_id, only: %i[show update] do
    member do
      get :result
    end
  end
end
