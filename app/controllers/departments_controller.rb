class DepartmentsController < ApplicationController
  before_action :set_department, only: [:show, :update, :destroy]

  def index
    department = Department.all
    render json: {departments: department}
  end

  def get_employees
    department = Department.find(params[:id])
    employees = department.employees
    render json: employees, status:200 
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
    if @department.destroy
      head :no_content
    else
      render json: @department.errors.messages, status: :unprocessable_entity
    end
  end

  private
  
  def department_params
    params.require(:department).permit(:name)
  end

  def set_department
    @department = Department.find(params[:id])
  end
end
