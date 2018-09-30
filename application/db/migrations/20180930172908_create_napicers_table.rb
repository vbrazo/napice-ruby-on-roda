Sequel.migration do
  up do
    create_table(:napicer) do
      primary_key :id
      String :first_name, null: false
      String :last_name, null: false
      String :username, null: false
      DateTime :created_at
      DateTime :updated_at
    end
  end

  down do
    drop_table(:napicer)
  end
end
