Sequel.migration do
  up do
    create_table(:napicer) do
      primary_key :id
      foreign_key :user_id, :user, null: false
      String :first_name, null: false
      String :last_name, null: false
      String :username, null: false
      String :avatar
      String :status
      String :nickname, null: false
      String :availability
      String :desired_hourly_rate
      String :self_description
      String :mailing_address_1
      String :mailing_address_2
      String :phone
      String :timezone
      String :city
      String :state_or_province
      String :postal_code
      String :country
      String :skype
      String :twitter
      String :github_username
      String :linkedin_url
      String :current_employment_situation
      String :data_science
      String :development
      String :devops
      String :design
      String :management
      String :storage
      String :others
      String :introduction
      String :nationality
      String :position
      DateTime :created_at
      DateTime :updated_at
    end
  end

  down do
    drop_table(:napicer)
  end
end
