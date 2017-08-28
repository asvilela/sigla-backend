class Api::V1::Domains::CompanyTypesController < ApplicationController

  # GET /company_types
  def index
    company_types = CompanyType.all    
    render json: company_types, status: :ok
  end

end
