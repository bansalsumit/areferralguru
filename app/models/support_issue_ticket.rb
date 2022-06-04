# == Schema Information
#
# Table name: support_issue_tickets
#
#  id          :bigint           not null, primary key
#  description :string
#  email       :string
#  subject     :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class SupportIssueTicket < ApplicationRecord
end
