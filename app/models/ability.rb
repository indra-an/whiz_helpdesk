class Ability
  include CanCan::Ability

  def initialize(user)
    unless user.nil?
        if user.full_access?
          can :manage, :all
        elsif user.is_operator?
          operator_ability
        elsif user.is_engineer?
          engineer_ability
        end
    end
  end

  def operator_ability
    can [:read, :create, :post_reply], Ticket
  end

  def engineer_ability
    can [:read, :update, :post_reply], Ticket
  end
end
