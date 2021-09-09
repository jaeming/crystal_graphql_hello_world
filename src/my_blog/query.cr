require "graphql"
  
@[GraphQL::Object]
class Query
  include GraphQL::ObjectType
  include GraphQL::QueryType

  @[GraphQL::Field]
  def echo(str : String) : String
    str
  end
end