class AddPasswordDigestToMusers < ActiveRecord::Migration
  def change
    add_column :musers, :password_digest, :string
  end
end
