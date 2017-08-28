class Api::V1::Domains::PhasesController < ApplicationController
  
  # GET /phases
  def index
    phases = Phase.all    
    render json: phases, status: :ok
  end

end
