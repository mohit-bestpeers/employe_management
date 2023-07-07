class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :update, :destroy]

  def index
    @employee = Employee.all
    render json: {employees: @employee}
  end

  def show
    render json:  @employee
  end

  def create
    employee = Employee.new(employee_params)
    if employee.save
      render json: employee, status: :created
    else
      render json: employee.errors, status: :unprocessable_entity
    end
  end
  
  def update
  
    if  @employee.update(employee_params)
      render json:  @employee
    else
      render json:  @employee.errors, status: :unprocessable_entity
    end
  end

  def destroy 
    @employee.destroy
    head :no_content
  end

  def get_employees_by_department
    department = Department.find(params[:id])
    employees = department.employees
    render json: employees, status:200 
  end

  private
  
  def employee_params
    params.require(:employee).permit(:name, :email, :password ,:department_id)
  end

  def set_employee
    @employee = Employee.find(params[:id])
  end
end