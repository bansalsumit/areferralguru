class EmailTemplatePolicy < ApplicationPolicy
  class Scope
    def initialize(user, scope)
      @user  = user
      @scope = scope
    end

    def resolve
      if user.has_role? :admin
        scope.all
      else
        scope.where(id: nil)
      end
    end

    private

    attr_reader :user, :scope
  end

  def initialize(user, email_template)
    @user  = user
    @email_template = email_template
  end

  def create?
    (user.has_role? :admin)
  end

  def update?
    create?
  end

  private

  attr_reader :user, :email_template
end
