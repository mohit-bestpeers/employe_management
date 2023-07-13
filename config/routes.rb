Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get '/employees/:employee_id/leaves_applied', to: 'leaves#leaves_applied'
  patch '/employees/:employee_id/leaves_approve/:id', to: 'leaves#leaves_approve'
  # Defines the root path route ("/")
  resources :employees do
    resources :tasks
    resources :attendances
    resources :leaves
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
