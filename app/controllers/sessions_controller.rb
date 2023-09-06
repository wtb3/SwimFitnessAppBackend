class SessionsController < ApplicationController
  before_action :find_session, only: [:show, :update, :destroy]

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      # Successful login, generate authentication token (JWT)
      token = JWT.encode({ user_id: user.id }, Rails.application.secrets.secret_key_base, "HS256")

      render json: { token: token }, status: :ok
    else
      render json: { error: "Invalid credentials" }, status: :unauthorized
    end
  end

  def show
    render json: @session
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end

  def find_session
    @session = Session.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Session not found" }, status: :not_found
  end
end
