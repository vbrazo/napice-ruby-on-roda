Dir['./lib/gem_ext/graphql/**/*.rb'].each { |rb| require rb }

file_path = File.dirname(__FILE__)

%w(fields mutations amutations types).each do |path|
  Dir["#{file_path}/#{path}/**/*.rb"].each { |file| require file }
end

require 'graphql'

Schema = GraphQL::Schema.define do
  query QueryType
  mutation MutationType
end
