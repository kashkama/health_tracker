class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   has_many :foods
   has_many :exercises

  def food_total_calories
    total_calories = 0

    self.foods.each do |food|
      total_calories += food.calories
    end

    total_calories
  end

  def exercise_total_calories
    total_calories = 0

    self.exercises.each do |exercise|
      total_calories += exercise.calories

    end

    total_calories
  end
end
