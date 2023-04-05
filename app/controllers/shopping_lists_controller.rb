class ShoppingListsController < ApplicationController
  def index
    @food_amount = 0
    @total_price = 0
    @recipe_foods = []
    @need_foods = RecipeFood.where(recipe_id: params[:recipe_id])
    @need_foods.each do |need_food|
      new_food_id = need_food.foods_id
      new_val = Food.where(user: current_user).where(id: new_food_id).first.quantity
      quantity_needed = new_val - need_food.quantity
      next if quantity_needed >= 0

      need_food.quantity = quantity_needed * -1
      @recipe_foods << need_food
    end
    @recipe_foods.each do |f|
      @total_price += f.food.price * f.quantity
    end
  end

  def show
    @food_amount = 0
    @total_price = 0
    @recipe_foods = []
    @recepes = Recipe.where(user_id: current_user.id)
    @need_foods = []
    @recepes.each do |recipe|
      @current_food = RecipeFood.where(recipe_id: recipe.id)
      @current_food.each do |food|
        @ingredient = @need_foods.find { |f| f.foods_id == food.foods_id }
        if @ingredient.nil?
          @need_foods.push(food)
        else
          @ingredient.quantity = @ingredient.quantity + food.quantity
        end
      end
    end
    @need_foods.each do |need_food|
      new_food_id = need_food.foods_id
      new_val = Food.where(user: current_user).where(id: new_food_id).first.quantity
      quantity_needed = new_val - need_food.quantity
      next if quantity_needed >= 0

      need_food.quantity = quantity_needed * -1
      @recipe_foods << need_food
    end
    @recipe_foods.each do |f|
      @total_price += f.food.price * f.quantity
    end
  end
end
