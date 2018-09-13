require 'sequel'

Sequel.database_timezone = :local

# basic plugins
Sequel::Model.plugin :validation_helpers
Sequel::Model.plugin :nested_attributes
Sequel::Model.plugin :boolean_readers
Sequel::Model.plugin :table_select
Sequel::Model.plugin :dirty
Sequel::Model.plugin :string_stripper

class Api
  unless defined? SEQUEL_DB
    SEQUEL_DB = Sequel.connect(
      ENV.fetch('DATABASE_ENV'),
      connect_timeout: 5,
      read_timeout: 8,
      write_timeout: 5
    )
  end
end
