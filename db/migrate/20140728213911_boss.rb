class Boss < ActiveRecord::Migration
  def change
    change_table :contacts do |t|
      t.integer :boss_id
    end
  end
end
