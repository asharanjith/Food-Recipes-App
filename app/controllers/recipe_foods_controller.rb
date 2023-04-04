class RecipeFoodsController < ApplicationController
  def new
    @recipe_food = RecipeFood.new
    @recipe_id = params[:recipes_id]
    @foods = current_user.foods
  end

  def create
    @recipe_food = RecipeFood.new(params_recipe_foods)

    if @recipe_food.save
      redirect_to recipe_path(params[:recipes_id])
    else
      render 'new'
    end
  end

  def destroy
    @recipe_food = RecipeFood.find(params[:id])
    @recipe_food.destroy
    redirect_to recipe_path(@recipe_food.recipes_id), notice: 'Recipe food was successfully deleted.'
  end

  private

  def params_recipe_foods
    params.require(:recipe_food).permit(:quantity, :foods_id, :recipes_id)
  end
end
