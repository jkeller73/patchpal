class WeatherAlertPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def complete?
    true
  end
end
