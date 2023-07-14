class SalarysController < ApplicationController
  before_action :set_employee
  before_action :set_salary, only: [:show, :update]

  def index
    salarys = @employee.salarys
    if salarys
    render json: salarys, each_serializer: SalarySerializer 
    else
      render json: salarys.error.messages
    end
  end
  
  def show
    render json: @salary, each_serializer: SalarySerializer 
  end

  def create
    salary =  @employee.salarys.new 
    if salary.save
      render json: salary, status: :created
    else
      render json: salary.errors.messages, status: :unprocessable_entity
    end
  end

  private
    
  def set_employee
    @employee = Employee.find(params[:employee_id])
  end

  def set_salary
    @salary = @employee.salarys.find(params[:id])
  end 
end
