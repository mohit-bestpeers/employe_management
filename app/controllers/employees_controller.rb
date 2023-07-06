class EmployeesController < ApplicationController

  def index
    @employee = Employee.all
    render json: @employee
  end
end