class Api::V1::ConditionalsController < ApplicationController

  before_action :set_conditional, only: [:show, :update, :destroy]

  # GET /conditionals/1
  def show
    render json: @conditional, status: :ok
  end

  # POST /conditionals
  def create
    conditional = Conditional.new(conditional_params)

    if conditional.save
      render json: conditional, status: :created
    else
      render json: { errors: conditional.errors }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /conditionals/1
  def update
    if @conditional.update(conditional_params)
      render json: @conditional, status: :ok
    else
      render json: { errors: @conditional.errors }, status: :unprocessable_entity
    end    
  end

  # DELETE /conditionals/1
  def destroy
    @conditional.destroy
  end  

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_conditional
    @conditional = Conditional.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def conditional_params
    params.require(:conditional).permit(:title, :description, :due_date, :document_id, 
      :conditional_status_id, :conditional_type_id, :recurrence_type_id)
  end

end
