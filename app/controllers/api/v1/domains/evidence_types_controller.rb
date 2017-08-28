class Api::V1::Domains::EvidenceTypesController < ApplicationController

  # GET /evidence_types
  def index
    evidence_types = EvidenceType.all    
    render json: evidence_types, status: :ok
  end

end
