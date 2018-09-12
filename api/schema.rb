QueryType = GraphQL::ObjectType.define do
  name "Query"
  description "The query root of this schema"

  field :user do
    
  end
end

Schema = GraphQL::Schema.new(query: QueryType)
