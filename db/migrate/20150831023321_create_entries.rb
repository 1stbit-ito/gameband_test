class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries, id: false, :options => 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
      t.string :entry_id, :null => false, :limit => 16
      t.string :entry_user_id, :null => false, :limit => 16
      t.text     :entry_user_nickname, :null => false
      t.datetime :entry_time, :null => false
      t.integer :game_id, :default => 0, :null => false
      t.integer :event_id, :default => 0, :null => false
      t.text :content, :null => false
      t.text :entry_tags_ids, :null => false
      t.text :reply_to, :null => false
      t.boolean :entry_type, :default => 0, :null => false
      t.string :parent_id, :null => false, :limit => 16
      t.text :relation_tag, :null => false
      t.text :image_path01, :null => false
      t.text :image_path02, :null => false
      t.text :image_path03, :null => false
      t.text :image_path04, :null => false
      t.integer :retweet_num, :default => 0, :null => false
      t.integer :favorite_num, :default => 0, :null => false
      t.integer :warning_num, :default => 0, :null => false
      t.boolean :delete_flag, :default => 0, :null => false
      t.datetime :created_at, :null => false
      t.datetime :updated_at, :null => false
    end
    execute "ALTER TABLE entries ADD PRIMARY KEY (entry_id);"
    execute "ALTER TABLE entries ADD INDEX entry_user_id(entry_user_id);"
  end
end
