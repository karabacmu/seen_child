class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :phone_no
      t.string :hashed_password
      t.string :salt

      t.timestamps
    end
  end
end
