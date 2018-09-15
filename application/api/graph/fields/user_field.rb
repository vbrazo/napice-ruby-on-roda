UserField = GraphQL::Field.define do
  name 'User'
  description 'Single user'
  type UserType

  argument :id, types.Int

  resolve ->(_obj, args, _ctx) { Api::Models::User.find(args['id']) }
end
