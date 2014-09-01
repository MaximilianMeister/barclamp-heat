name "heat-server_remove"
description "Deactivate Heat Server Role"
run_list(
  "recipe[heat::remove_server]"
)
default_attributes()
override_attributes()
