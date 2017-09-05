class Api::V1::CompaniesController < ApplicationController

  before_action :set_company, only: [:show, :update, :destroy]

  # GET /companies
  def index
    # count: 10, page: 1, size: 10,
    company = Company.all
    render json: company, status: :ok
  end

  # GET /companies/1
  def show
    render json: @company, include: [:address], status: :ok
  end

  # POST /companies
  def create
    company = Company.new(company_params)
    company.address = company.build_address(address_params)

    if company.save
      render json: company, include: [:address], status: :created
    else
      render json: { errors: company.errors }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /companies/1
  def update
    if @company.update(company_params) && @company.address.update(address_params)
      render json: @company, include: [:address], status: :ok
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
    params.require(:company).permit(:active, :cnpj, :company_name, :trade_name)
  end

  def address_params
    params.require(:company).require(:address).permit(:id, :zipCode, :street, :number, :complement, :neighborhood, :city, :state, :country, :gia, :ibge)
  end

end