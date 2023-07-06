class EmployeesController < ApplicationController

  def index
    @employee = Employee.all
    render json: {employees: @employee}
  end

  def show
    employee = Employee.find(params[:id])
    render json: employee
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
    employee = Employee.find(params[:id])

    if employee.update(employee_params)
      render json: employee
    else
      render json: employee.errors, status: :unprocessable_entity
    end
  end

  def destroy 
    employee = Employee.find(params[:id])
    employee.destroy
    head :no_content
  end

   
  private
  
  def employee_params
    params.require(:employee).permit(:name, :email, :password)
  end
end