# Creates the database table plus indexes you'll need to use Eventy
class SetupEventy < ActiveRecord::Migration
  def self.up
    execute "CREATE EXTENSION hstore"

    create_table :events, force: true do |t|
      t.string :name
      t.string :identity
      t.hstore :properties
      t.timestamps
    end

    add_index :events, :name
    add_index :events, [:identity, :name]
    add_index :events, :properties, using: :gin
  end

  def self.down
    drop_table :events

    execute "DROP EXTENSION hstore"
  end
end
