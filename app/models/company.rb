class Company < ApplicationRecord

  has_many :memberships
  has_many :members, through: :memberships, source: :user

end
