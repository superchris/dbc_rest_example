class PolymorphicAddresses < ActiveRecord::Migration
  def change
    change_table :addresses do |t|
      t.remove :contact_id
      t.integer :addressable_id
      t.string :addressable_type
    end
  end
end
