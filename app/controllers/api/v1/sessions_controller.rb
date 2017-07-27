class Api::V1::SessionsController < ApplicationController

  # POST /users
  def create
    user = User.find_by(email: session_params[:email])

    if user && user.valid_password?(session_params[:password])
      sign_in user, store: false
      # Gerar novo token e salvar
      render json: user, status: :ok
    else
      render json: { errors: 'Invalid e-mail or password'}, status: :unauthorized
    end
  end

  # DELETE /users/1
  def destroy
    user = User.find_by(authentication_token: params[:id])

    if user 
      user.authentication_token = nil

      if user.save
        head :no_content
      else
        head :unauthorized
      end
    else
      head :unauthorized
    end
  end

  private

  # Only allow a trusted parameter "white list" through.
  def session_params
    params.require(:session).permit(:email, :password)
  end

end
