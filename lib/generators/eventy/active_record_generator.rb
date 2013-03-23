require 'rails/generators/migration'
require 'rails/generators/active_record/migration'

module Eventy
  class ActiveRecordGenerator < Rails::Generators::Base
    include Rails::Generators::Migration
    extend ActiveRecord::Generators::Migration

    self.source_paths << File.join(File.dirname(__FILE__), 'templates')

    def copy_migration
      migration_template 'setup_eventy.rb', "db/migrate/setup_eventy.rb"
    end
  end
end
