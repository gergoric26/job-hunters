class Ability
  include CanCan::Ability

  def initialize(user)
    
    if user.is_a?(Admin)

      can :manage, :all 

    elsif user.is_a?(User)

      can :show, Profile

      can :read, Profile do |profile|
      profile.try(:user) == user
      end
      can :update, Profile do |profile|
      profile.try(:user) == user
      end
      can :destroy, Profile do |profile|
      profile.try(:user) == user
      end
      can :create, Profile

    else

      can :show, Profile
      cannot :destroy
      cannot :create

    end
  end
end
