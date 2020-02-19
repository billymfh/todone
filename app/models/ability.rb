# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    can :manage, List, user_id: user.id
    can :manage, ListItem, list: { user_id: user.id }
  end
end
