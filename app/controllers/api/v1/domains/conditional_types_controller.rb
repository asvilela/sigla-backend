class Api::V1::Domains::ConditionalTypesController < ApplicationController

  # GET /conditional_types
  def index
    conditional_types = ConditionalType.all    
    render json: conditional_types, status: :ok
  end

end
