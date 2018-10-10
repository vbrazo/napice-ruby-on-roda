Sequel.migration do
  up do
    create_table(:napicer_skill) do
      primary_key :id
      foreign_key :skill_id, :skill, null: false
      String :napicer_id, null: false
      String :level, null: false
      String :years_of_experience, null: false
      DateTime :created_at
      DateTime :updated_at
    end
  end

  down do
    drop_table(:napicer_skill)
  end
end
