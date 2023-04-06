require 'rails_helper'

RSpec.describe Food, type: :model do
  before(:each) do
    @user = User.create!(email: 'max@email.com', password: 'password', name: 'Gulalai')
    @recipe = Recipe.create!(user: @user, name: 'Ground beef', preparation_time: '10 min', cooking_time: '45 min',
                             description: 'Lorem ipsum', public: true)

    @food = Food.create!(user_id: @user.id, name: 'Ground beef', measurement_unit: 'kg', price: 12)
    @ingredient = RecipeFood.create!(quantity: 1, recipe_id: @recipe.id, food_id: @food.id)
  end

  context 'Testing validations' do
    it 'Food is not valid without a name' do
      @food.name = nil
      expect(@food).to_not be_valid
    end

    it 'Food is a valid with a name' do
      expect(@food).to be_valid
    end

    it 'Food is not valid with measurement_unit' do
      @food.measurement_unit = nil
      expect(@food).to_not be_valid
    end

    it 'Food is valid with measurement_unit' do
      expect(@food).to be_valid
    end

    it 'Food is not valid with price' do
      @food.price = nil
      expect(@food).to_not be_valid
    end

    it 'Food is valid with price' do
      expect(@food).to be_valid
    end
  end
end
