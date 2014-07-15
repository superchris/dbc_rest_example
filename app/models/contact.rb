class Contact < ActiveRecord::Base
  has_many :addresses
  belongs_to :company
end
