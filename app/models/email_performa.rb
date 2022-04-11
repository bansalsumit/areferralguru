# == Schema Information
#
# Table name: email_performas
#
#  id                :bigint           not null, primary key
#  closing           :string
#  email_body        :string
#  name              :string
#  recipient         :string
#  salutaion         :string
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

  belongs_to :shop
  belongs_to :email_template
end
