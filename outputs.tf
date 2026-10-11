output "adm_remediation_recipes_id" {
  description = "Map of id values across all adm_remediation_recipes, keyed the same as var.adm_remediation_recipes except keys with no id are omitted"
  value       = { for k, v in oci_adm_remediation_recipe.adm_remediation_recipes : k => v.id if v.id != null && length(v.id) > 0 }
}
output "adm_remediation_recipes_compartment_id" {
  description = "Map of compartment_id values across all adm_remediation_recipes, keyed the same as var.adm_remediation_recipes except keys with no compartment_id are omitted"
  value       = { for k, v in oci_adm_remediation_recipe.adm_remediation_recipes : k => v.compartment_id if v.compartment_id != null && length(v.compartment_id) > 0 }
}
output "adm_remediation_recipes_defined_tags" {
  description = "Map of defined_tags values across all adm_remediation_recipes, keyed the same as var.adm_remediation_recipes except keys with no defined_tags are omitted"
  value       = { for k, v in oci_adm_remediation_recipe.adm_remediation_recipes : k => v.defined_tags if v.defined_tags != null && length(v.defined_tags) > 0 }
}
output "adm_remediation_recipes_detect_configuration" {
  description = "Map of detect_configuration values across all adm_remediation_recipes, keyed the same as var.adm_remediation_recipes except keys with no detect_configuration are omitted"
  value       = { for k, v in oci_adm_remediation_recipe.adm_remediation_recipes : k => one(v.detect_configuration) if v.detect_configuration != null && length(v.detect_configuration) > 0 }
}
output "adm_remediation_recipes_display_name" {
  description = "Map of display_name values across all adm_remediation_recipes, keyed the same as var.adm_remediation_recipes except keys with no display_name are omitted"
  value       = { for k, v in oci_adm_remediation_recipe.adm_remediation_recipes : k => v.display_name if v.display_name != null && length(v.display_name) > 0 }
}
output "adm_remediation_recipes_freeform_tags" {
  description = "Map of freeform_tags values across all adm_remediation_recipes, keyed the same as var.adm_remediation_recipes except keys with no freeform_tags are omitted"
  value       = { for k, v in oci_adm_remediation_recipe.adm_remediation_recipes : k => v.freeform_tags if v.freeform_tags != null && length(v.freeform_tags) > 0 }
}
output "adm_remediation_recipes_is_run_triggered_on_kb_change" {
  description = "Map of is_run_triggered_on_kb_change values across all adm_remediation_recipes, keyed the same as var.adm_remediation_recipes except keys with no is_run_triggered_on_kb_change are omitted"
  value       = { for k, v in oci_adm_remediation_recipe.adm_remediation_recipes : k => v.is_run_triggered_on_kb_change if v.is_run_triggered_on_kb_change != null }
}
output "adm_remediation_recipes_knowledge_base_id" {
  description = "Map of knowledge_base_id values across all adm_remediation_recipes, keyed the same as var.adm_remediation_recipes except keys with no knowledge_base_id are omitted"
  value       = { for k, v in oci_adm_remediation_recipe.adm_remediation_recipes : k => v.knowledge_base_id if v.knowledge_base_id != null && length(v.knowledge_base_id) > 0 }
}
output "adm_remediation_recipes_network_configuration" {
  description = "Map of network_configuration values across all adm_remediation_recipes, keyed the same as var.adm_remediation_recipes except keys with no network_configuration are omitted"
  value       = { for k, v in oci_adm_remediation_recipe.adm_remediation_recipes : k => one(v.network_configuration) if v.network_configuration != null && length(v.network_configuration) > 0 }
}
output "adm_remediation_recipes_scm_configuration" {
  description = "Map of scm_configuration values across all adm_remediation_recipes, keyed the same as var.adm_remediation_recipes except keys with no scm_configuration are omitted"
  value       = { for k, v in oci_adm_remediation_recipe.adm_remediation_recipes : k => one(v.scm_configuration) if v.scm_configuration != null && length(v.scm_configuration) > 0 }
}
output "adm_remediation_recipes_state" {
  description = "Map of state values across all adm_remediation_recipes, keyed the same as var.adm_remediation_recipes except keys with no state are omitted"
  value       = { for k, v in oci_adm_remediation_recipe.adm_remediation_recipes : k => v.state if v.state != null && length(v.state) > 0 }
}
output "adm_remediation_recipes_system_tags" {
  description = "Map of system_tags values across all adm_remediation_recipes, keyed the same as var.adm_remediation_recipes except keys with no system_tags are omitted"
  value       = { for k, v in oci_adm_remediation_recipe.adm_remediation_recipes : k => v.system_tags if v.system_tags != null && length(v.system_tags) > 0 }
}
output "adm_remediation_recipes_time_created" {
  description = "Map of time_created values across all adm_remediation_recipes, keyed the same as var.adm_remediation_recipes except keys with no time_created are omitted"
  value       = { for k, v in oci_adm_remediation_recipe.adm_remediation_recipes : k => v.time_created if v.time_created != null && length(v.time_created) > 0 }
}
output "adm_remediation_recipes_time_updated" {
  description = "Map of time_updated values across all adm_remediation_recipes, keyed the same as var.adm_remediation_recipes except keys with no time_updated are omitted"
  value       = { for k, v in oci_adm_remediation_recipe.adm_remediation_recipes : k => v.time_updated if v.time_updated != null && length(v.time_updated) > 0 }
}
output "adm_remediation_recipes_verify_configuration" {
  description = "Map of verify_configuration values across all adm_remediation_recipes, keyed the same as var.adm_remediation_recipes except keys with no verify_configuration are omitted"
  value       = { for k, v in oci_adm_remediation_recipe.adm_remediation_recipes : k => one(v.verify_configuration) if v.verify_configuration != null && length(v.verify_configuration) > 0 }
}

