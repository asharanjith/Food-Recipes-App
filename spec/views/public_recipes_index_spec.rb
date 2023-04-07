require 'rails_helper'

RSpec.feature 'Public Recipe index', type: :feature do
  describe 'public recipe index page' do
    before :each do
      @userone = User.new(name: 'Test User', email: 'test@gmail.com', password: 'password', confirmed_at: Time.now)
      @recipetwo = Recipe.new(name: 'Lava cake', prepration_time: '10 min', cooking_time: '20 min',
                              description: 'Description of recipe', public: true, user_id: @userone.id)
      @userone.save
      @recipetwo.save
      visit user_session_path
      fill_in 'Email', with: 'test@gmail.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'
      visit new_recipe_path
      fill_in 'Name', with: 'Lava cake'
      fill_in 'Prepration time', with: '10 min'
      fill_in 'Cooking time', with: '20 min'
      fill_in 'Description', with: 'Description of recipe'
      check 'Public'
      click_button 'Add Recipe'
    end

    it 'displays all public recipes' do
      visit public_recipes_path
      expect(page).to have_content('Public Recipes')
      expect(page).to have_text('Lava cake')
      expect(page).to have_text('Test User')
    end
  end
end
