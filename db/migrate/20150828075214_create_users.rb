class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users, id: false, :primary_key => :user_id, :options => 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
      t.string   :user_id, :null => false, :limit => 16
      t.string   :login_id, :null => false, :limit => 16
      t.string   :password, :null => false, :limit => 16
      t.text     :client_id, :null => false
      t.text     :nickname, :null => false
      t.text     :icon_image_path, :null => false
      t.text     :header_image_path, :null => false
      t.boolean  :delete_flag, :default => 0, :null => false
      t.datetime :created_at, :null => false
      t.datetime :updated_at, :null => false
    end
    execute "ALTER TABLE users ADD PRIMARY KEY (user_id);"
    execute "ALTER TABLE users ADD INDEX login_id(login_id);"
  end
end
