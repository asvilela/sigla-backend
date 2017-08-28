class Api::V1::Domains::ConditionalStatusesController < ApplicationController

  # GET /conditional_statuses
  def index
    conditional_statuses = ConditionalStatus.all    
    render json: conditional_statuses, status: :ok
  end

end
