class ExercisesController < ApplicationController
  before_action :set_exercise, only: [:show, :edit, :update, :destroy]

  def index
    @exercises = Exercise.all
  end

  def show
  end

  def new
    @user = current_user
    @exercise = Exercise.new
  end

  def edit
  end

  def create
    @user = current_user
    @exercises = @user.exercises
    @exercise = Exercise.new(exercise_params)
    @exercise.user = @user
    redirect_to user_path(@user)
    if @exercise.save
      respond_to do |format|
        format.html{redirect_to user_path(@user)}
        format.js
      end
    else
      flash[:notice] = "exercise not included"
    end
  end

  def update
    if @exercise.update(exercise_params)
      redirect_to @exercise, notice: 'Exercise was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @exercise.destroy
    redirect_to exercises_url, notice: 'Exercise was successfully destroyed.'
  end

  private
    def exercise_params
      params.require(:exercise).permit(:exercise, :calories)
    end
end
