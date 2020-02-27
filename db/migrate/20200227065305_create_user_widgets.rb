class CreateUserWidgets < ActiveRecord::Migration[6.0]
  def change
    create_table :user_widgets do |t|
      t.references :user, foreign_key: true
      t.string :name, null: false
      t.string :description
      t.integer :kind
      t.timestamps
    end
  end
end
