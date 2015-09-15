class CreateEvents < ActiveRecord::Migration
  def change
    create_table    :events, id: false, :options => 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
      t.integer     :event_id, :null => false
      t.integer     :game_id, :null => false
      t.text        :name, :null => false
      t.text        :description, :null => false
      t.integer     :tag_id, :default => 0, :null => false
      t.text        :tag_name, :null => false
      t.integer     :event_type, :default => 0, :null => false
      t.integer     :revival_event_id, :null => false
      t.datetime    :start_date, :null => false
      t.datetime    :finish_date, :null => false
      t.boolean     :delete_flag, :default => 0, :null => false
      t.datetime    :created_at, :null => false
      t.datetime    :updated_at, :null => false
    end
    execute "ALTER TABLE events ADD PRIMARY KEY (event_id);"
    execute "ALTER TABLE events CHANGE event_id event_id int(11) AUTO_INCREMENT;"
    execute "ALTER TABLE events ADD INDEX idx_game_id(game_id);"
  end
end
