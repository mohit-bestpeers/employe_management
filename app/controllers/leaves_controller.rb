class LeavesController < ApplicationController
  before_action :set_employee, only: [:index,:show, :update, :destroy, :create, :leaves_applied , :leaves_approve]
  before_action :set_leave, only: [:show, :update, :destroy ]

  def index
    leaves = @employee.leaves
    render json: leaves, each_serializer: LeaveSerializer
  end

  def show
    render json: @leave, each_serializer: LeaveSerializer
  end

  def create
    leave= @employee.leaves.new(leave_params)
    if leave.save
      render json: leave, status: :created
    else
      render json: leave.errors.messages, status: :unprocessable_entity
    end
  end
  
  def update 
    if @leave.update(leave_params)
      render json:@leave
    else
      render json: @leave.errors.messages
    end
  end

  def destroy
    @leave.destroy
  end
  
  def leaves_applied
    leaves = Leave.where(mail_to: @employee.email)
    render json: leaves 
  end 

  def leaves_approve
    leave = Leave.where(mail_to: @employee.email ,id:params[:id])
    if leave.update(leave_params)
      render json:leave
    else
      render json: leave.errors.messages
    end
  end

  private

  def leave_params
    params.require(:leave).permit(:leave_type, :from_date, :to_date, :days, :mail_to, :reason, :from_session, :to_session ,:status)
  end

  def set_employee
    @employee = Employee.find(params[:employee_id])
  end

  def set_leave
    @leave = @employee.leaves.find(params[:id])
  end 
end
