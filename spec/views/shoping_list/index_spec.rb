require 'rails_helper'

RSpec.describe 'Shopping list page view', type: :feature do
  describe 'Shopping list index page' do
    before(:each) do
      @user = User.create!(name: 'Test User', email: 'test@gmail.com', password: 'password',
                           password_confirmation: 'password')
      @recipe = Recipe.create!(user: @user, name: 'Ground beef', prepration_time: '10 min', cooking_time: '45 min',
                               description: 'Lorem ipsum', public: true)

      @food = Food.create!(user_id: @user.id, name: 'Ground beef', measurement_unit: 'kg', price: 12)
      @ingredient = RecipeFood.create!(quantity: 1, recipe_id: @recipe.id, food_id: @food.id)


      visit 'users/sign_in'
      fill_in 'Email', with: 'max@email.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'
    end

    it 'Index content of shopping_list page' do
      visit "/shopping_lists/#{@recipe.id}"
      expect(page).to have_content('Shopping List')
      expect(page).to have_content('Amount of food items to buy: 1')
      expect(page).to have_content('Total value of food needed: $12')
    end
  end
end
