class CreateYamajis < ActiveRecord::Migration
  def change
    create_table :yamajis do |t|
      t.string :name
      t.string :mail
      t.datetime :updated_at
      t.timestamps null: false
    end
  end
end
