# == Schema Information
#
# Table name: memberships
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  company_id :integer
#  role       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Membership < ApplicationRecord

  belongs_to :company
  belongs_to :user
  
end
