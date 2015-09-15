class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags, id: false, :options => 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
      t.integer :tag_id
      t.text :tag_name, :null => false
      t.integer :game_id, :default => 0, :null => false
      t.integer :event_id, :default => 0, :null => false
      t.boolean :delete_flag, :default => 0, :null => false
      t.datetime :created_at, :null => false
      t.datetime :updated_at, :null => false
    end
    execute "ALTER TABLE tags ADD PRIMARY KEY (tag_id);"
    execute "ALTER TABLE tags CHANGE tag_id tag_id int(11) AUTO_INCREMENT;"
  end
end
