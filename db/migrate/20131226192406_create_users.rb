class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :login_name
      t.string :user_uuid

      t.timestamps
    end
  end
end
