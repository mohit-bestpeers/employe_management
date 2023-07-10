class DesignationsController < ApplicationController
  before_action :set_designation, only: [:show, :update, :destroy]

  def index
    designations = Designation.all
    render json: designations ,each_serializer: DesignationSerializer
  end

  def get_designations
    designation = Designation.find(params[:id])
    employees = designation.employees
    count = employees.count
    render json:  {
      employees: employees,
      count: count
    }, each_serializer: EmployeeSerializer, status:200 
  end

  def show
    render json: @designation
  end

  def create
    designation = Designation.new(designation_params)
    if designation.save
      render json: designation, status: :created
    else
      render json: designation.errors.messages, status: :unprocessable_entity
    end
  end
  
  def update
    if  @designation.update(designation_params)
      render json: @designation
    else
      render json: @designation.errors.messages, status: :unprocessable_entity
    end
  end

  def destroy 
    @designation.destroy
    head :no_content
  end

  private
  
  def designation_params
    params.require(:designation).permit(:name)
  end

  def set_designation
    @designation = Designation.find(params[:id])
  end
end
