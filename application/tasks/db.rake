namespace :db do
  desc 'Prints current schema version'
  task :version do
    version = if DB.tables.include?(:schema_migrations)
                DB[:schema_migrations].order(:filename.desc).first[:filename]
              end || 0

    puts "Schema Version: #{version}"
  end

  desc 'Perform migration up to latest migration available'
  task :migrate do
    Sequel.extension :migration, :core_extensions
    Sequel::Migrator.run(DB, 'application/db/migrations')
    Rake::Task['db:version'].execute
  end
end
