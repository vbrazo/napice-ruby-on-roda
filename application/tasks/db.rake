namespace :db do
  desc 'Performs migration up to latest migration available'
  task :migrate do
    Sequel.extension :migration, :core_extensions
    Sequel::Migrator.run(DB, 'application/db/migrations')
    Rake::Task['db:version'].execute
  end

  desc 'Generates a new timestamped Sequel migration'
  task :migration, :name do |_, args|
    if args[:name].nil?
      puts 'Please specify a name for your migration (e.g. rake generate:migration[add_user_table])'
      exit false
    end

    timestamp = Time.now.utc.strftime('%Y%m%d%H%M%S')
    filename = File.join('application/db/migrations', "#{timestamp}_#{args[:name]}.rb")

    require 'fileutils'
    FileUtils.cp_r('application/db/migrations/migration_template.rb', filename)

    puts "Created the migration #{filename}"
  end

  desc 'Drop all database tables and re-run migrations'
  task :reset do
    DB.tables.each { |table| DB.drop_table(table.to_sym, cascade: true) }

    Rake::Task['db:migrate'].execute
  end

  desc 'Prints current schema version'
  task :version do
    version = if DB.tables.include?(:schema_migrations)
                DB[:schema_migrations].order(:filename.desc).first[:filename]
              end || 0

    puts "Schema Version: #{version}"
  end
end
