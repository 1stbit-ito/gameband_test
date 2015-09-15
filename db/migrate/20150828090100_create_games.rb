class CreateGames < ActiveRecord::Migration
  def change
    create_table :games, id: false, :options => 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
      t.integer   :game_id
      t.text      :name, :null => false
      t.text      :description, :null => false
      t.integer   :tag_id, :default => 0, :null => false
      t.text      :tag_name, :null => false
      t.text      :icon_image_path, :null => false
      t.text      :header_image_path, :null => false
      t.text      :web_view_url, :null => false
      t.text      :profile_key_name01, :null => false
      t.text      :profile_key_name02, :null => false
      t.text      :profile_key_name03, :null => false
      t.text      :profile_key_name04, :null => false
      t.text      :profile_key_name05, :null => false
      t.text      :profile_key_name06, :null => false
      t.text      :profile_key_name07, :null => false
      t.text      :profile_key_name08, :null => false
      t.text      :profile_key_name09, :null => false
      t.text      :profile_key_name10, :null => false
      t.boolean   :delete_flag, :default => 0, :null => false
      t.datetime  :created_at, :null => false
      t.datetime  :updated_at, :null => false
    end
    execute "ALTER TABLE games ADD PRIMARY KEY (game_id);"
    execute "ALTER TABLE games CHANGE game_id game_id int(11) AUTO_INCREMENT;"
  end
end
