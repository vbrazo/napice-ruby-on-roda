Sequel.migration do
  up do
    create_table(:napicer_education) do
      primary_key :id
      foreign_key :napicer_id, :napicer, null: false
      String :school, null: false
      String :degree, null: false
      String :self_description, null: false
      String :start_date
      String :end_date
      DateTime :created_at
      DateTime :updated_at
    end
  end

  down do
    drop_table(:napicer_education)
  end
end
