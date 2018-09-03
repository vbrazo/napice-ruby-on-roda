QueryType = GraphQL::ObjectType.define do
  name "Query"
  description "The query root of this schema"

  field :user do
    type PostType
    argument :id, !types.ID
    resolve -> (obj, args, ctx) { Post.find(id: args["id"]) }
  end
end

Schema = GraphQL::Schema.new(query: QueryType)
