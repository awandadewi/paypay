# == Schema Information
#
# Table name: companies
#
#  id            :integer          not null, primary key
#  name          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  kw_integrated :boolean          default("f"), not null
#

class Company < ApplicationRecord

  has_many :memberships
  has_many :members, through: :memberships, source: :user

end
