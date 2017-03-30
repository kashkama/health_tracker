class FoodsController < ApplicationController
  before_action :set_food, only: [:show, :edit, :update, :destroy]

  def index
  end



  def new
    @user = current_user
    @food =  Food.new
    respond_to do |format|
      format.html{}
      format.js
    end
  end



  def create
    @user = current_user
    @foods = @user.foods
    @food = Food.new(food_params)
    @food.user = @user
    redirect_to user_path(@food.user)
    if @food.save
      respond_to do |format|
        format.html {redirect_to user_path(@food.user)}
        format.js
      end
    else
      flash[:notice] = "no food saved"
    end
  end

  def add
    @user = current_user
    @consumed_food = Food.find(params[:id])
    @food = Food.new(name: @consumed_food.name, calories: @consumed_food.calories)
    @food.user = @user
    @food.save
    respond_to do |format|
      format.html{}
      format.js
    end
  end



  private
    def food_params
      params.require(:food).permit(:food, :calories)
    end
end
