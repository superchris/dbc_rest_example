class RenameContacts < ActiveRecord::Migration
  def change
    rename_table :contacts, :dbasrule_contacts

    change_table :dbasrule_contacts do |t|
      t.rename :id, :not_id
    end

  end
end
