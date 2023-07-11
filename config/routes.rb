Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  resources :employees do
    resources :tasks
  end

  resources :departments do
    member do
      get :get_employees
    end
  end

  resources :designations do
    member do
      get :get_employees
    end
  end
end
