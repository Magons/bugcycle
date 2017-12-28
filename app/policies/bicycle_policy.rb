class BicyclePolicy < ApplicationPolicy
  def update?
    @record.user_id == user.id
  end

  def destroy?
    update?
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
