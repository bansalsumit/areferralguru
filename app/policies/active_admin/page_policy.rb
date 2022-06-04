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
      user.has_admin_or_owner_role?
    when 'Emails'
      user.has_admin_or_owner_role?
    when 'Invite Customers'
      user.has_admin_or_owner_role?
    when 'Contact us'
      true
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

  def select_email?
    case record.name
    when 'Emails'
      user.has_admin_or_owner_role?
    else
      false
    end
  end

  def single_invite?
    user.has_admin_or_owner_role?
  end

  def bulk_invite?
    user.has_admin_or_owner_role?
  end
end
