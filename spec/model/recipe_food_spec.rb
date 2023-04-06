require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  before(:each) do
    @user = User.create!(email: 'max@email.com', password: 'password', name: 'Fuad')
    @recipe = Recipe.create!(user: @user, name: 'Ground beef', preparation_time: '10 min', cooking_time: '45 min',
                             description: 'Lorem ipsum', public: true)

    @food = Food.create!(user_id: @user.id, name: 'Ground beef', measurement_unit: 'kg', price: 12)
    @ingredient = RecipeFood.create!(quantity: 1, recipe_id: @recipe.id, food_id: @food.id)
  end

  context 'Testing validations' do
    it 'RecipeFood is not valid without a quantity' do
      @ingredient.quantity = nil
      expect(@ingredient).to_not be_valid
    end

    it 'RecipeFood is a valid with a quantity' do
      expect(@ingredient).to be_valid
    end

    it 'RecipeFood is not valid without a integer quantity' do
      @ingredient.quantity = 'nil'
      expect(@ingredient).to_not be_valid
    end

    it 'RecipeFood is a valid with a integer quantity' do
      expect(@ingredient).to be_valid
    end

    it 'RecipeFood is not valid with a integer that smaller than 0 quantity' do
      @ingredient.quantity = -2
      expect(@ingredient).to_not be_valid
    end

    it 'RecipeFood is a valid with a integer that bigger than 0 quantity' do
      expect(@ingredient).to be_valid
    end
  end
end
