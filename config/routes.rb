Rails.application.routes.draw do
  root "trainings#index"

  resources :trainings, only: [:index, :show, :new, :create, :edit, :update] do
    resources :exercises, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    end
  end

  resources :exercises, only: [] do
    resources :exercise_sets, only: [:new, :create, :index, :edit, :update, :destroy]
  end
end
