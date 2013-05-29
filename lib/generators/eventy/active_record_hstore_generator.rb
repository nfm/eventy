require 'rails/generators'
require 'rails/generators/migration'

class Eventy::ActiveRecordHstoreGenerator < Rails::Generators::Base
  include Rails::Generators::Migration
  source_root File.expand_path('../templates', __FILE__)

  def self.next_migration_number(path)
    Time.now.utc.strftime("%Y%m%d%H%M%S")
  end

  def copy_migrations
    migration_template 'setup_eventy_hstore.rb', "db/migrate/setup_eventy.rb"
  end
end
