class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites, id: false, :options => 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
      t.string :user_id, :null => false, :limit => 16
      t.integer :game_id, :null => false
      t.string :entry_id, :null => false, :limit => 16
      t.boolean :delete_flag, :default => 0, :null => false
      t.datetime :created_at, :null => false
      t.datetime :updated_at, :null => false
    end
    execute "ALTER TABLE favorites ADD PRIMARY KEY (user_id, game_id, entry_id);"
  end
end
