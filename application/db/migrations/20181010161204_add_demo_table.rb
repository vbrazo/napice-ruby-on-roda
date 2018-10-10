Sequel.migration do
  up do
    create_table(:demo) do
      primary_key :id
      String :first_name, null: false
      String :last_name, null: false
      String :email, null: false
      String :phone
      String :company_name
      String :company_website
      DateTime :created_at
      DateTime :updated_at
    end
  end

  down do
    drop_table(:demo)
  end
end
