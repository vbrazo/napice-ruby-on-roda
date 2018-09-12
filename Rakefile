require 'sequel'

namespace :db do
  task :environment do
    puts 'task environment'
  end

  desc "Run all migrations in db/migrate"
  task :migrate => :connect do
    Sequel.extension(:migration)
    Sequel::Migrator.apply(DB, "db/migrate")
  end

  task :connect => :environment do
    DB = Sequel.connect("sqlite://blog.db")
  end
end
