class Api::V1::EvidencesController < ApplicationController

  before_action :set_evidence, only: [:show, :update, :destroy]

  # GET /evidences/1
  def show
    render json: @evidence, status: :ok
  end

  # POST /evidences
  def create
    evidence = Evidence.new(evidence_params)

    if evidence.save
      render json: evidence, status: :created
    else
      render json: { errors: evidence.errors }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /evidences/1
  def update
    if @evidence.update(evidence_params)
      render json: @evidence, status: :ok
    else
      render json: { errors: @evidence.errors }, status: :unprocessable_entity
    end    
  end

  # DELETE /evidences/1
  def destroy
    @evidence.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_evidence
    @evidence = Evidence.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def evidence_params
    params.require(:evidence).permit(:title, :description, :number, :file_path, :file_date, :task_id, :evidence_type_id)
  end
end


