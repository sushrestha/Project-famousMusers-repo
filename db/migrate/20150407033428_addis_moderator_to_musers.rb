class AddisModeratorToMusers < ActiveRecord::Migration
  def change
    add_column :musers, :isModerator, :integer
  end
end
