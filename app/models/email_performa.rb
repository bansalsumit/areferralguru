# == Schema Information
#
# Table name: email_performas
#
#  id                :bigint           not null, primary key
#  active            :boolean          default(FALSE)
#  closing           :string
#  email_body        :string
#  name              :string
#  recipient         :string
#  salutation        :string
#  sender            :string
#  subject           :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  email_template_id :bigint
#  shop_id           :bigint
#
# Indexes
#
#  index_email_performas_on_email_template_id  (email_template_id)
#  index_email_performas_on_shop_id            (shop_id)
#
class EmailPerforma < ApplicationRecord
  has_one_attached :logo
  has_one_attached :banner

  belongs_to :shop
  belongs_to :email_template

  def self.define_image_attribute(name)
    define_method("get_" + name.to_s) do
      if self.send(name).attached?
        self.send(name)
      else
        self.email_template.send("get_" + name.to_s)
      end
    end
  end

  def self.define_email_attribute(name)
    define_method("get_" + name.to_s) do
      if self.send(name).present?
        self.send(name)
      else
        self.email_template.send("get_" + name.to_s)
      end
    end
  end

  [:logo, :banner].each do |attr|
    define_image_attribute attr
  end

  [:closing, :email_body, :name, :recipient, :salutation, :sender, :subject].each do |attr|
    define_email_attribute attr
  end
end
