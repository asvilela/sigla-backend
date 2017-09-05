class Api::V1::EnterprisesController < ApplicationController

  before_action :set_enterprise, only: [:show, :update, :destroy]

  # GET /enterprises/1
  def show
    render json: @enterprise, status: :ok
  end

  # POST /enterprises
  def create
    enterprise = Enterprise.new(enterprise_params)

    if enterprise.save
      render json: enterprise, status: :created
    else
      render json: { errors: enterprise.errors }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /enterprises/1
  def update
    if @enterprise.update(enterprise_params)
      render json: @enterprise, status: :ok
    else
      render json: { errors: @enterprise.errors }, status: :unprocessable_entity
    end    
  end

  # DELETE /enterprises/1
  def destroy
    @enterprise.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_enterprise
    @enterprise = Enterprise.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def enterprise_params
    params.require(:enterprise).permit(:title, :description, :active, :enterprise_type_id, :address_id, :company_id)
  end

end
