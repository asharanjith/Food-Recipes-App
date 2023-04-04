class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the user here. For example:
    #
    return unless user.present?

    can :read, :all 
    can :manage, Food, user_id: user.id
    can :manage, Recipe, user_id: user.id
  
  end
end
