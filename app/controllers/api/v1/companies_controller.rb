class Api::V1::CompaniesController < ApplicationController

  before_action :set_company, only: [:show, :update, :destroy]

  # GET /companies/1
  def show
    @company = Company.find(params[:id])
    render json: @company, status: :ok
  end

  # POST /companies
  def create
    company = Company.new(company_params)

    if company.save
      render json: company, status: :created
    else
      render json: { errors: company.errors }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /companies/1
  def update
    if @company.update(company_params)
      render json: @company, status: :ok
    else
      render json: { errors: @company.errors }, status: :unprocessable_entity
    end    
  end

  # DELETE /companies/1
  def destroy
    @company.destroy
  end


  private 

  # Use callbacks to share common setup or constraints between actions.
  def set_company
    @company = Company.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def company_params
    params.require(:company).permit(:active, :cnpj, :company_name, :trade_name, :company_type_id)
  end

end
