class Ability
  include CanCan::Ability

  def initialize(user)

  end

  def admin_abilities
    can access:, :rails_admin
    can :dashboard
    can :manage, [Author, User, Book, Cupon, Category, Rating, Order]
  end

  def user_abilities
    
  end
end
