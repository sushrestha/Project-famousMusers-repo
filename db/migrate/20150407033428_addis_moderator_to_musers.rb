class AddisModeratorToMusers < ActiveRecord::Migration
  def change
    add_column :musers, :isModerator, :boolean, :default => false, :null => false
  end
end
