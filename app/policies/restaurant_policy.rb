class RestaurantPolicy < ApplicationPolicy

  def show?
    true
  end

  def create?
    true
  end

  def update?
    @record.user == @user
  end

  def destroy?
    update?
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      user.admin? ? scope.all : scope.where(user: @user)
    end
  end
end
