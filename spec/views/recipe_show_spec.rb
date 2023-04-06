require 'rails_helper'

RSpec.feature 'Recipe show page', type: :feature do
  describe 'recipe show page' do
    before :each do
      @userone = User.new(name: 'Test User', email: 'test@gmail.com', password: 'password', confirmed_at: Time.now)
      @recipeone = Recipe.new(name: 'Lava cake', prepration_time: '10 min', cooking_time: '20 min',
                              description: 'Description of recipe', public: false, user_id: @userone.id)
      @userone.save
      @recipeone.save
      visit user_session_path
      fill_in 'Email', with: 'test@gmail.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'
      visit new_recipe_path
      fill_in 'Name', with: 'Lava cake'
      fill_in 'Prepration time', with: '10 min'
      fill_in 'Cooking time', with: '20 min'
      fill_in 'Description', with: 'Description of recipe'
      click_button 'Add Recipe'
    end

    it 'displays all details of each recipe' do
      visit recipes_path
      click_on 'Lava cake'
      expect(page).to have_text('Lava cake')
      expect(page).to have_text('Description of recipe')
      expect(page).to have_text('10 min')
      expect(page).to have_text('20 min')
      expect(page).to have_link('Add ingredient')
      expect(page).to have_link('Generate shopping list')
    end
  end
end
