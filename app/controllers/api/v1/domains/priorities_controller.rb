class Api::V1::Domains::PrioritiesController < ApplicationController

  # GET /priorities
  def index
    priorities = Priority.all    
    render json: priorities, status: :ok
  end

end
