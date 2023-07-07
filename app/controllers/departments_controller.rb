class DepartmentsController < ApplicationController
  def index
    @departments = Department.find(params[:id])
    @department = Department.all
    render json: {departments: @department}
  end
end
