Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  resources :employees 

  resources :departments do
    get :get_employees, on: :member
  end

  resources :designations do
    get :get_designations, on: :member
  end
end
