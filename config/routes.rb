Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get '/employees/:employee_id/applied_leaves', to: 'leaves#applied_leaves'
  patch '/employees/:employee_id/approve_leaves/:id', to: 'leaves#approve_leaves'
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
