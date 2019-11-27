class PatchPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    @patches = policy_scope(Patch)
  end

  def show?
    true
  end

  def create?
    true
  end

  def update?
    current_user?
    # record.user == user
  end

  def destroy?
    current_user?
    # record.user == user
  end

  private

  def current_user?
    record.user == user
  end

end
