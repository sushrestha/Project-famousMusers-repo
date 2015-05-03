class AddMuserRefToNotification < ActiveRecord::Migration
  def change
    add_reference :notifications, :muser, index: true
    add_foreign_key :notifications, :musers
  end
end
