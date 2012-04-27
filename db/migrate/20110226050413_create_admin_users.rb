class CreateAdminUsers < ActiveRecord::Migration
  def self.up
    create_table :admin_users do |t|
      t.string "email"
      t.string "hashed_password"
      t.string "salt"
      t.boolean "admin", :default => false

      t.timestamps
    end
    add_index("admin_users", "email")
  end

  def self.down
    drop_table :admin_users
  end
end
