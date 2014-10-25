class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :name,            null: false, unique: true
      t.string  :email,           null: false, unique: true
      t.string  :password_digest, null: false
      t.integer :beenz,           null: false, default: 3

      t.timestamps
    end
  end
end
