class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end

  def show?
    user == record.user
  end

  def create?
    true
  end

  def destroy?
    true
  end
end
