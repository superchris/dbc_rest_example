class Contact < ActiveRecord::Base
  has_many :addresses, as: :addressable
  belongs_to :company
end
