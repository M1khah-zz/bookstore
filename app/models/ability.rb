class Ability
  include CanCan::Ability

  def initialize(user)
    if user
      user.admin ? admin_abilities : user_abilities(user)
    else
      guest_abilities
    end
  end

  def admin_abilities
    can access:, :rails_admin
    can :dashboard
    can :manage, [Author, User, Book, Cupon, Category, Rating, Order]
  end


  def user_abilities
    guest_abilities
    can :read, [Book, Category, Rating, Author]
    can :manage, Order, user_id: user.id
    can :manage, CreditCard, user_id: user.id
    can :manage, User, id: user.id
    can :create, Rating, user_id: user.id
    can :manage, Order, user_id: user.id
    can :manage, OrderItem, order: {
          user_id: user.id, state: 'in_progress' }
    can [:read, :update], Coupon
  end

  def guest_abilities
    can :read, [Book, Category, Author, Rating]
  end
end
