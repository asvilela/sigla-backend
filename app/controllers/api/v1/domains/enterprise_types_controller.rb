class Api::V1::Domains::EnterpriseTypesController < ApplicationController

  # GET /enterprise_types
  def index
    enterprise_types = EnterpriseType.all    
    render json: enterprise_types, status: :ok
  end

end
