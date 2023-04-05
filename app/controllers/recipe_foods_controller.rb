class RecipeFoodsController < ApplicationController
  def new
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = RecipeFood.new
    @recipe_id = @recipe.id
    @food = Food.where(user_id: current_user.id)
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @food = Food.find_by(user_id: current_user.id)
    @recipe_food = RecipeFood.new(recipe_food_params)
    respond_to do |format|
      if @recipe_food.save
        format.html { redirect_to recipe_path(params[:recipe_id]), notice: 'Recipe food was successfully created.' }
        format.json { render :show, status: :created, location: @recipe_food }
      else
        format.html { render :new, status: :unprocessable_entity, notice: 'Recipe food was not created.' }
        format.json { render json: @recipe_food.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @recipe_food = RecipeFood.find(params[:id])
    @recipe_food.destroy
    redirect_to recipe_path(params[:recipe_id]), notice: 'Recipe food was successfully deleted.'
  end

  private

  def recipe_food_params
    params.require(:recipe_food).permit(:quantity, :recipe_id, :food_id)
  end
end
