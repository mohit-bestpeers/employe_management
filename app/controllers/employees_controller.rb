class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :update, :destroy]

  def index
    employees = Employee.all
    render json: employees,each_serializer: EmployeeSerializer
  end

  def show
    render json: @employee
  end

  def create
    employee = Employee.new(employee_params)
    if params[:detail].present?
      @detail = @employee.build_detail(detail_params)
    end
    if employee.save
      render json: employee, status: :created
    else
      render json: employee.errors.messages, status: :unprocessable_entity
    end
  end
  
  def update
    if @employee.update(employee_params)
      render json: @employee
    else
      render json: @employee.errors.messages, status: :unprocessable_entity
    end
  end

  def destroy 
      @employee.destroy
      head :no_content
  end

  private
  
  def employee_params
    params.require(:employee).permit(:name, :email, :password , :department_id)
  end

  def detail_params
    params.permit(detail: [:father_name, :mother_name, :date_of_birth,
     :contact, :emergency_contact, :skills, :date_of_joining, :present_address, :permanent_address]).fetch(:detail, {}).permit!
  end
  

  def set_employee
    @employee = Employee.find(params[:id])
  end
end
