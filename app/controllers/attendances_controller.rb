class AttendancesController < ApplicationController
  before_action :set_employee, only: [:index,:show, :update, :destroy, :create]
  before_action :set_attendance, only: [:show, :update, :destroy]

  def index
    attendances = @employee.attendances
    render json: attendances ,each_serializer: AttendanceSerializer
  end

  def show
    render json: @attendance, each_serializer: AttendanceSerializer
  end

  def create
    attendance = @employee.attendances.new(attendance_params)
    if attendance.save
      render json: attendance, status: :created
    else
      render json: attendance.errors.messages, status: :unprocessable_entity
    end
  end

  def update 
    if @attendance.update(attendance_params)
      render json:@attendance
    else
      render json: @attendance.errors.messages
    end
  end

  def destroy
    @attendance.destroy
  end

  private

  def attendance_params
    params.require(:attendance).permit(:to, :date, :in_time, :out_time, :status, :task)
  end

  def set_employee
    @employee = Employee.find(params[:employee_id])
  end

  def set_attendance
    @attendance = @employee.attendances.find(params[:id])
  end 
end
