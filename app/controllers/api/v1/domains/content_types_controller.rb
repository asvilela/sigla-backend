class Api::V1::Domains::ContentTypesController < ApplicationController

  # GET /content_types
  def index
    content_types = ContentType.all    
    render json: content_types, status: :ok
  end

end
