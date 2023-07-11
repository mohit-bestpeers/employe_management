class TasksController < ApplicationController
  before_action :set_employee, only: [:index,:show, :update, :destroy,:create]
  before_action :set_task, only: [:show, :update, :destroy]

  def index
    tasks = @employee.tasks.all
    render json: tasks ,each_serializer: TaskSerializer
  end

  def show
    render json: @task, each_serializer: TaskSerializer
  end

  def create
    task = @employee.tasks.create(task_params)
    if task
      render json: task, status: :created
    else
      render json: task.errors.messages
    end
  end

  def update
    if @task.update(task_params)
      render json: @task
    else
      render json: @task.errors.messages
    end
  end

  def destroy
    @task.destroy
  end

  private
  
  def task_params
    params.require(:task).permit(:title, :description, :start_date, :due_date, :status)
  end

  def set_task
    @task = @employee.tasks.find(params[:id])
  end

  def set_employee
    @employee = Employee.find(params[:employee_id])
  end
end

