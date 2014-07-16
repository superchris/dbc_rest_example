class Contact < ActiveRecord::Base
  has_many :addresses, as: :addressable
  belongs_to :company

  def self.only_gary
    where(name: "Gary")
  end

  def self.at_gmail
    where("email like '%gmail%'")
  end
end
