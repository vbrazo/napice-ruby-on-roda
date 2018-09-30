Sequel.migration do
  up do
    create_table(:napicer_skill) do
      primary_key :id
      Integer :skill_id, null: false
      String :napicer_id, null: false
      String :level, null: false
      DateTime :created_at
      DateTime :updated_at
    end
  end

  down do
    drop_table(:napicer)
  end
end
