resource = "heat"
main_role = "server"
role_name = "#{resource}-#{main_role}"

unless node["roles"].include?(role_name)
  heat_server_service = []
  ["engine", "api", "api_cfn", "api_cloudwatch"].each do |name|
    heat_server_service << node[resource][name]["service_name"]
  end

  barclamp_role role_name do
    service_name heat_server_service
    action :remove
  end

  # delete all attributes from node
  node.delete(resource)

  node.save
end
