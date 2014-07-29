class Contact < ActiveRecord::Base

  self.table_name = :dbasrule_contacts
  self.primary_key = :not_id
  
  has_many :addresses, as: :addressable
  belongs_to :company, foreign_key: "foodly_id"

  belongs_to :boss, class_name: "Contact"

  has_many :peons, class_name: "Contact", foreign_key: "boss_id"

  def self.only_gary
    where(name: "Gary")
  end

  def self.at_gmail
    where("email like '%gmail%'")
  end
end
