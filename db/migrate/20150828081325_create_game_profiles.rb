class CreateGameProfiles < ActiveRecord::Migration
  def change
    create_table :game_profiles, id: false, :options => 'ENGINE=InnoDB DEFAULT CHARSET=utf8'  do |t|
      t.string    :user_id, :null => false, :limit => 16
      t.integer   :game_id, :null => false
      t.text      :comment, :null => false
      t.text      :image_path01, :null => false
      t.text      :image_path02, :null => false
      t.text      :image_path03, :null => false
      t.text      :image_path04, :null => false
      t.text      :value01, :null => false
      t.text      :value02, :null => false
      t.text      :value03, :null => false
      t.text      :value04, :null => false
      t.text      :value05, :null => false
      t.text      :value06, :null => false
      t.text      :value07, :null => false
      t.text      :value08, :null => false
      t.text      :value09, :null => false
      t.text      :value10, :null => false
      t.date      :play_start_date, :null => false
      t.time      :login_start_time, :null => false
      t.time      :login_finish_time, :null => false
      t.boolean   :delete_flag, :default => 0,  :null => false
      t.datetime  :created_at, :null => false
      t.datetime  :updated_at, :null => false
    end
    execute "ALTER TABLE game_profiles ADD PRIMARY KEY (user_id, game_id);"
  end
end
