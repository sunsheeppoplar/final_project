class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.text :f_name
      t.text :l_name
      t.text :email
      t.text :password_digest

      t.timestamps null: false
    end
  end
end
