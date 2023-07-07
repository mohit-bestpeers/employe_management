Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  resources :employees 
  get "/department/:id/employees", to: "employees#get_employees_by_department"
end
