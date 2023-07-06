class EmployeesController < ApplicationController

  def index
    @employee = Employee.all
    render json: @employee
  end

  def show
    @employee = Employee.find(params[:id])
    render json: @employee
  end

end