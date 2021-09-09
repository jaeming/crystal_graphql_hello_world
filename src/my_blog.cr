require "kemal"
require "graphql"
require "./my_blog/query"

module MyBlog
  VERSION = "0.1.0"

  schema = GraphQL::Schema.new(Query.new)
  puts schema.document.to_s

  post "/graphql" do |env|
    env.response.content_type = "application/json"

    query = env.params.json["query"].as(String)
    variables = env.params.json["variables"]?.as(Hash(String, JSON::Any)?)
    operation_name = env.params.json["operationName"]?.as(String?)
    schema.execute(query, variables, operation_name)
  end
  Kemal.run
end
