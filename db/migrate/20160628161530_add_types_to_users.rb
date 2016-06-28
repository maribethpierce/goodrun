class AddTypesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :star, :boolean, default: true
    add_column :users, :admin, :boolean, default: false
    add_column :users, :company_user, :boolean, default: false
    add_column :users, :first_name, :string, null: false
    add_column :users, :last_name, :string, null: false
    add_column :users, :gender, :string
    add_column :users, :age, :string, array: true
    add_column :users, :birth_month, :string
    add_column :users, :relationship_status, :string
    add_column :users, :race, :string
    add_column :users, :anual_income, :string
    add_column :users, :children, :string
    add_column :users, :kid_ages, :integer, array: true
    add_column :users, :twins, :boolean, default: false
    add_column :users, :twin_ages, :integer, array: true
    add_column :users, :education, :string
    add_column :users, :career, :string
    add_column :users, :employer, :string
    add_column :users, :phone, :string
    add_column :users, :alt_phone, :string
    add_column :users, :zip, :string
    add_column :users, :closest_city, :string
    add_column :users, :referral, :string
  end
end
