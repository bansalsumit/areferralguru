# == Schema Information
#
# Table name: email_templates
#
#  id         :bigint           not null, primary key
#  closing    :string
#  email_body :string
#  name       :string
#  recipient  :string
#  salutation :string
#  sender     :string
#  subject    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class EmailTemplate < ApplicationRecord
  has_one_attached :logo
  has_one_attached :banner

  def self.define_image_attribute(name)
    define_method("get_" + name.to_s) do
      self.send(name)
    end
  end

  def self.define_email_attribute(name)
    define_method("get_" + name.to_s) do
      self.send(name)
    end
  end

  define_image_attribute :logo
  define_image_attribute :banner

  define_email_attribute :closing
  define_email_attribute :email_body
  define_email_attribute :name
  define_email_attribute :recipient
  define_email_attribute :salutation
  define_email_attribute :sender
  define_email_attribute :subject
end
