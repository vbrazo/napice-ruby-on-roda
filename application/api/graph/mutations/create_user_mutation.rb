module UserMutations
  Create = GraphQL::Relay::Mutation.define do
    name 'CreateUser'
    description 'Create a User'

    # Define input parameters
    input_field :first_name, types.String
    input_field :last_name, types.String
    input_field :username, types.String
    input_field :email, types.String

    # Define return parameters
    return_field :id, types.Int

    resolve -> (_obj, args, _ctx) { Api::Operations::User::Create.new(args) }
  end
end
