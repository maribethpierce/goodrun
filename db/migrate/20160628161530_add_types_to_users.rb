class AddTypesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :super_user, :boolean, default: true
    add_column :users, :admin, :boolean, default: false
    add_column :users, :company, :boolean, default: false
  end
end
