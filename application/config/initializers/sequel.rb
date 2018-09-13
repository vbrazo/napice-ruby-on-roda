require 'sequel'

Sequel.database_timezone = :local

# basic plugins
Sequel::Model.plugin :validation_helpers
Sequel::Model.plugin :nested_attributes
Sequel::Model.plugin :boolean_readers
Sequel::Model.plugin :table_select
Sequel::Model.plugin :dirty
Sequel::Model.plugin :string_stripper
