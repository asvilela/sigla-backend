class Api::V1::TasksController < ApplicationController

  before_action :set_task, only: [:show, :update, :destroy]  

  # GET /tasks/1
  def show
    render json: @task, status: :ok
  end

  # POST /tasks
  def create
    task = Task.new(task_params)

    if task.save
      render json: task, status: :created
    else
      render json: { errors: task.errors }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tasks/1
  def update
    if @task.update(task_params)
      render json: @task, status: :ok
    else
      render json: { errors: @task.errors }, status: :unprocessable_entity
    end    
  end

  # DELETE /tasks/1
  def destroy
    @task.destroy
  end  

  private  

  # Use callbacks to share common setup or constraints between actions.
  def set_task
    @task = Task.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def task_params
    params.require(:task).permit(:title, :description, :start_date, :due_date, 
      :conditional_id, :priority_id, :task_status_id)
  end
end
