Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'courses#index'

  resources :courses, only: [:index, :show] do
    scope module: :courses do
      resources :groups, only: [] do
        scope module: :groups do
          resource :student_registration, only: [:create]
        end
      end
    end
  end
end
