class UpdateUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :date_of_birth, :date
    add_column :users, :active, :boolean, default: true
    add_column :users, :image_url, :string
    add_column :users, :image_profile, :text
  end
end
