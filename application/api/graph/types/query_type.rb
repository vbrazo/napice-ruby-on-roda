QueryType = GraphQL::ObjectType.define do
  name 'Query'
  description 'The query root for the schema'

  field :user, UserField
end
