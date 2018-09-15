MutationType = GraphQL::ObjectType.define do
  name 'Mutation'
  description 'The mutation root for the schema'

  field :create_user, field: UserMutations::Create.field
end
