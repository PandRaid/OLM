class ChangeFormatinUsers < ActiveRecord::Migration
  def self.up
   change_column :users, :birth, :date
  end

  def self.down
   change_column :users, :birth, :date
  end
end
