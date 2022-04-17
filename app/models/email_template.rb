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
end