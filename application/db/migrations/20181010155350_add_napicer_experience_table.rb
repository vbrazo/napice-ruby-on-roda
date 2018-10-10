Sequel.migration do
  up do
    create_table(:napicer_experience) do
      primary_key :id
      foreign_key :napicer_id, :napicer, null: false
      String :title, null: false
      String :location, null: false
      String :self_description, null: false
      String :start_date
      String :end_date
      String :description
      String :technologies
      DateTime :created_at
      DateTime :updated_at
    end
  end

  down do
    drop_table(:napicer_experience)
  end
end
