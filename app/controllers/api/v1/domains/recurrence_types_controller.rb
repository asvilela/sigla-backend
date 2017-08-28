class Api::V1::Domains::RecurrenceTypesController < ApplicationController

  # GET /recurrence_types
  def index
    recurrence_types = RecurrenceType.all    
    render json: recurrence_types, status: :ok
  end

end
