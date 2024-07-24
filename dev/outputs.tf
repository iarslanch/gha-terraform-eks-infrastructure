# #### 01 TaskDefinition outputs ####

# output "ecs_task_arn_1" {
#   value = module.ecs_task_definition_1.task_definition_arn
# }

# # # output "ecs_task_arn_2" {
# # #   value = module.ecs_task_definition_2.task_definition_arn
# # # }




# #### 02 LoadBalancer 443 Arn outputs ####


# output "alb_listener_443_arn" {
#   value = module.alb_listener_443.loadbalancer_listener_arn
# }


# #### 03 LoadBalancer TargerGroup Arn outputs ####

# output "alb_target_groups_cloud_demo" {
#   value = module.alb_target_groups_cloud_demo.target_group_arn
# }

# output "alb_target_groups_03" {
#   value = module.alb_target_groups_03.target_group_arn
# }




# ### LoadBalancer Listners Rules Arn outputs ####

# output "listerners_rules_1" {
#   value = module.listerners_rules_1.listener_rules_arn
# }


# output "listerners_rules_2" {
#   value = module.listerners_rules_2.listener_rules_arn
# }











#### Secrets Name outputs ####


# output "secrets_output" {
#   value = module.secrets.example
#   sensitive = true
# }



# output "secrets_output2" {
#   value = module.secrets1.example
#   sensitive = true
# }



#### RDS Security Groups ID outputs ####


# output "mysql_sg_output" {
#   description = "The db security group id"
#   value       =  module.mysql.db_sg
# }

# output "mssql_sg_output" {
#   description = "The db security group id"
#   value       =  module.mssql.db_sg
# }