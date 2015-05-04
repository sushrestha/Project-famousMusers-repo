class AddMuserRefToSubscribeCategory < ActiveRecord::Migration
  def change
    add_reference :subscribe_categories, :muser, index: true
    add_foreign_key :subscribe_categories, :musers
  end
end
