class PlantPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    @plants = policy_scope(Plants)
  end

  def show?
    true
  end
end
