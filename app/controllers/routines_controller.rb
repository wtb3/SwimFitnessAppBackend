class RoutinesController < ApplicationController
  before_action :find_routine, only: [:update, :destroy, :show]

  def index
    routines = Routine.all
    render json: routines
  end

  def show
    render json: @routine
  end

  def create
    routine = Routine.new(routine_params)
    if routine.save
      render json: routine, status: :created
    else
      render json: { errors: routine.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @routine.update(routine_params)
      render json: { message: "Routine updated successfully" }, status: :ok
    else
      render json: { errors: @routine.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    if @routine.destroy
      render json: { message: "Routine deleted successfully" }, status: :ok
    else
      render json: { errors: @routine.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def routine_params
    params.require(:routine).permit(:user_id, :exercise_id, :reps)
  end

  def find_routine
    @routine = Routine.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Routine not found" }, status: :not_found
  end
end
