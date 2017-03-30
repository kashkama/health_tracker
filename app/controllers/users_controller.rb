class UsersController < ApplicationController
  # before_action :authenticate_user!

  def index
    @user = current_user
    @food = @user.foods
  end

  def new

  end

  def create
    #code
  end

  def show
    @user = current_user
    @foods = @user.foods
    @exercises = @user.exercises
  end
end
