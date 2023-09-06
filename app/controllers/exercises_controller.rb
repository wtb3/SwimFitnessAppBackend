class ExercisesController < ApplicationController
  before_action :find_exercise, only: [:show, :update, :destroy]

  def index
    exercises = Exercise.all
    render json: exercises
  end

  def show
    render json: @exercise
  end

  def create
    exercise = Exercise.new(exercise_params)
    if exercise.save
      render json: { message: "Exercise created successfully" }, status: :created
    else
      render json: { error: "Exercise creation failed" }, status: :unprocessable_entity
    end
  end

  def update
    if @exercise.update(exercise_params)
      render json: { message: "Exercise updated successfully" }, status: :ok
    else
      render json: { error: "Exercise update failed" }, status: :unprocessable_entity
    end
  end

  def destroy
    if @exercise.destroy
      render json: { message: "Exercise deleted successfully" }, status: :ok
    else
      render json: { error: "Exercise deletion failed" }, status: :unprocessable_entity
    end
  end

  private

  def exercise_params
    params.require(:exercise).permit(:name, :description, :image_url, :video_url)
  end

  def find_exercise
    @exercise = Exercise.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Exercise not found" }, status: :not_found
  end
end
