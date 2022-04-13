class ActiveAdmin::PagePolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def show?
    case record.name
    when 'Dashboard'
      true
    when 'Widget'
      true
    when 'My Rewards'
      (user.has_role? :admin) || (user.has_role? :shop_owner)
    when 'Emails'
      (user.has_role? :admin) || (user.has_role? :shop_owner)
    else
      true
    end
  end
end
