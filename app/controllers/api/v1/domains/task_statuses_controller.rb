class Api::V1::Domains::TaskStatusesController < ApplicationController

  # GET /task_statuses
  def index
    task_statuses = TaskStatus.all    
    render json: task_statuses, status: :ok
  end

end
