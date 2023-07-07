class DepartmentsController < ApplicationController

  def index
    department = Department.all
    render json: {departments: department}
  end

  def get_employees
    department = Department.find(params[:id])
    employees = department.employees
    render json: employees, status:200 
  end

end
