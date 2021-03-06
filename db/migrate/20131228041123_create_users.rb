class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name, null: false
      t.string :last_name, null:false
      t.string :email, null:false
      t.string :login_name
      t.string :user_uuid, null:false
      t.string :password_digest

      t.timestamps
    end
  end
end
