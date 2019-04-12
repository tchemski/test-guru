Rails.application.routes.draw do
  root to: 'tests#index'

  devise_for :users, path: :gurus,
                     path_names: { sign_in: :login, sign_out: :logout },
                     controllers: { registrations: 'user/registrations' }

  resources :tests, param: :test_id, only: :index do
    member do
      post :start
    end
  end

  resources :tests_passages, param: :tests_passage_id, only: %i[show update] do
    member do
      get :result
    end
  end

  namespace :admin do
    root to: 'tests#index'
    resources :tests, param: :test_id do
      member do
        resources :questions, shallow: true, param: :question_id, except: :index do
          member do
            resources :answers, shallow: true, param: :answer_id, except: :index
          end
        end
      end
    end
  end
end
