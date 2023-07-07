class DepartmentsController < ApplicationController
  before_action :set_department, only: [:show, :update, :destroy]

  def index
    departments = Department.all
    render json: departments ,each_serializer: DepartmentSerializer
  end

  def get_employees
    department = Department.find(params[:id])
    employees = department.employees
    render json: employees, each_serializer: EmployeeSerializer, status:200 
  end

  def show
    render json: @department
  end

  def create
    department = Department.new(department_params)
    if department.save
      render json: department, status: :created
    else
      render json: department.errors.messages, status: :unprocessable_entity
    end
  end
  
  def update
    if  @department.update(department_params)
      render json: @department
    else
      render json: @department.errors.messages, status: :unprocessable_entity
    end
  end

  def destroy 
    @department.destroy
    head :no_content
  end

  private
  
  def department_params
    params.require(:department).permit(:name)
  end

  def set_department
    @department = Department.find(params[:id])
  end
end
