require 'rails_helper'

RSpec.describe Recipe, type: :model do
  let(:userone) do
    User.new(name: 'Test User', email: 'test@gmail.com', password: 'password', password_confirmation: 'password')
  end
  let(:recipe) do
    Recipe.new(name: 'Lava cake', prepration_time: '10 min', cooking_time: '20 min',
               description: 'Description of recipe', public: false, user: userone)
  end
  it 'is valid with valid attributes' do
    expect(recipe).to be_valid
  end

  it 'is not valid without a name' do
    recipe.name = nil
    expect(recipe).to_not be_valid
  end

  it 'is not valid without a prepration_time' do
    recipe.prepration_time = nil
    expect(recipe).to_not be_valid
  end

  it 'is not valid without a cooking_time' do
    recipe.cooking_time = nil
    expect(recipe).to_not be_valid
  end

  it 'is not valid without a description' do
    recipe.description = nil
    expect(recipe).to_not be_valid
  end

  it 'is not valid without a user' do
    recipe.user = nil
    expect(recipe).to_not be_valid
  end

  it 'is not valid with a name longer than 25 characters' do
    recipe.name = 'a' * 26
    expect(recipe).to_not be_valid
  end

  it 'is not valid with a description longer than 1000 characters' do
    recipe.description = 'a' * 1001
    expect(recipe).to_not be_valid
  end
end
