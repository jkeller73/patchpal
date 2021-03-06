class PatchPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
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

  def new?
    true
  end

  def plant?
    update?
  end

  def update?
    user_is_owner?
    # record.user == user
  end

  def destroy?
    user_is_owner?
    # record.user == user
  end

  private

  def user_is_owner?
    record.user == user
  end
end
