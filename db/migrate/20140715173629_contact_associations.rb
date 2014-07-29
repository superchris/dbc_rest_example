class ContactAssociations < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.belongs_to :contact
      t.string :street, :city, :state, :zip
    end

    create_table :companies do |t|
      t.string :name
    end

    change_table :contacts do |t|
      t.integer :foodly_id
    end

  end
end
