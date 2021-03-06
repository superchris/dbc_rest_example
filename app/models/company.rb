class Company < ActiveRecord::Base
  has_many :contacts

  has_many :contact_addresses, through: :contacts, source: :addresses

  has_many :addresses, as: :addressable
end
