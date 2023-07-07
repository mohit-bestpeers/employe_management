class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :update, :destroy]

  def index
    employee = Employee.all
    render json: {employees: employee}
  end

  def show
    render json: @employee
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
      render json: @employee
    else
      render json: @employee.errors.messages, status: :unprocessable_entity
    end
  end

  def destroy 
    if @employee.destroy
      head :no_content
    else
      render json: @employee.errors.messages, status: :unprocessable_entity
    end
  end

  private
  
  def employee_params
    params.require(:employee).permit(:name, :email, :password )
  end

  def set_employee
    @employee = Employee.find(params[:id])
  end
end
