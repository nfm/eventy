# Creates the database table plus indexes you'll need to use Eventy
class SetupEventy < ActiveRecord::Migration
  def self.up
    create_table :events, force: true do |t|
      t.string :name
      t.string :identity
      t.text :properties
      t.timestamps
    end

    add_index :events, :name
    add_index :events, [:identity, :name]
  end

  def self.down
    drop_table :events
  end
end
