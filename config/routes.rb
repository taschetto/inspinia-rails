Rails.application.routes.draw do
  root 'dashboard#index'
  devise_for :users, controllers: { registrations: 'registrations' }

  shallow do
    resources :organization do
      resources :project do
        resources :task
      end
    end
  end
end