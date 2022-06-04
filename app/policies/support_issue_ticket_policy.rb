class SupportIssueTicketPolicy < ApplicationPolicy
  class Scope
    def initialize(user, scope)
      @user  = user
      @scope = scope
    end

    def resolve
      if user.has_role? :admin
        scope.all
      else
        scope.where.not(name: 'admin')
      end
    end

    private

    attr_reader :user, :scope
  end

  def initialize(user, support_issue_ticket)
    @user  = user
    @support_issue_ticket = support_issue_ticket
  end

  def create?
    true
  end

  private

  attr_reader :user, :support_issue_ticket
end
