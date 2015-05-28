class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.admin?
      can :manage, Category
      can :manage, Question
    else
      can :create, Exam
      can [:read, :update], Exam, user_id: user.id
      can :read, Question
      can :read, Category
    end
  end
end
