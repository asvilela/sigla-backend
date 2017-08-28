class Api::V1::Domains::FeaturesController < ApplicationController

  # GET /features
  def index
    features = Feature.all    
    render json: features, status: :ok
  end

end
