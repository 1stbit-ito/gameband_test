class CreateTimelines < ActiveRecord::Migration
  def change
    create_table :timelines, id: false, :options => 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
      t.string :entry_id, :null => false, :limit => 16
      t.string :user_id, :null => false, :limit => 16
      t.string :entry_user_id, :null => false, :limit => 16
      t.datetime :entry_time, :null => false
      t.integer :game_id, :null => false
      t.integer :event_id, :default => 0, :null => false
      t.string :tags, :null => false
      t.integer :timeline_type, :default => 0, :null => false
      t.string :reply_to, :null => false
      t.boolean :retweet_flag, :default => 0, :null => false
      t.boolean :favorite_flag, :default => 0, :null => false
      t.boolean :warning_flag, :default => 0, :null => false
      t.boolean :delete_flag, :default => 0, :null => false
      t.datetime :created_at, :null => false
      t.datetime :updated_at, :null => false
    end
    execute "ALTER TABLE timelines ADD PRIMARY KEY (entry_id, user_id);"
    execute "ALTER TABLE timelines ADD INDEX user_id(user_id);"
    execute "ALTER TABLE timelines ADD INDEX user_id_game_id(user_id, game_id);"
    execute "ALTER TABLE timelines ADD INDEX user_id_event_id(user_id, event_id);"
    execute "ALTER TABLE timelines ADD INDEX user_id_game_id_type(user_id, game_id, timeline_type);"
  end
end
