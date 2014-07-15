class Company < ActiveRecord::Base
  has_many :contacts

  has_many :addresses, through: :contacts
end
