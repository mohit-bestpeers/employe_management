Rails.application.routes.draw do
  
  get '/employees/:employee_id/applied_leaves', to: 'leaves#applied_leaves'
  patch '/employees/:employee_id/approve_leaves/:id', to: 'leaves#approve_leaves'
  
  resources :employees do
    resources :tasks
    resources :attendances
    resources :salarys 
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
