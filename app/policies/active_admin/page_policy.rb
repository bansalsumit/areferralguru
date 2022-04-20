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
      false
    end
  end

  def get_email_preview?
    case record.name
    when 'Emails'
      user.has_admin_or_owner_role?
    else
      false
    end
  end

  def images_form?
    case record.name
    when 'Emails'
      user.has_admin_or_owner_role?
    else
      false
    end
  end
end
