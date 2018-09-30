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

  desc 'Remove all database tables and re-run migrations'
  task :reset do
    DB.tables.each { |table| DB.drop_table table.to_sym }

    Rake::Task['db:migrate'].execute
  end

  desc 'Generate a timestamped, empty Sequel migration.'
  task :migration, :name do |_, args|
    if args[:name].nil?
      puts 'You must specify a migration name (e.g. rake generate:migration[create_events])!'
      exit false
    end

    content = "Sequel.migration do\n  change do\n\n  end\nend\n"
    timestamp = Time.now.to_i
    filename = File.join('application/db/migrations', "#{timestamp}_#{args[:name]}.rb")

    File.open(filename, 'w') do |f|
      f.puts content
    end

    puts "Created the migration #{filename}"
  end
end
