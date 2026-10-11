resource "oci_adm_remediation_recipe" "adm_remediation_recipes" {
  for_each = var.adm_remediation_recipes

  compartment_id                = each.value.compartment_id
  is_run_triggered_on_kb_change = each.value.is_run_triggered_on_kb_change
  knowledge_base_id             = each.value.knowledge_base_id
  defined_tags                  = each.value.defined_tags
  display_name                  = each.value.display_name
  freeform_tags                 = each.value.freeform_tags
  state                         = each.value.state

  detect_configuration {
    exclusions                   = each.value.detect_configuration.exclusions
    max_permissible_cvss_v2score = each.value.detect_configuration.max_permissible_cvss_v2score
    max_permissible_cvss_v3score = each.value.detect_configuration.max_permissible_cvss_v3score
    max_permissible_severity     = each.value.detect_configuration.max_permissible_severity
    upgrade_policy               = each.value.detect_configuration.upgrade_policy
  }

  network_configuration {
    nsg_ids   = each.value.network_configuration.nsg_ids
    subnet_id = each.value.network_configuration.subnet_id
  }

  scm_configuration {
    branch                 = each.value.scm_configuration.branch
    build_file_location    = each.value.scm_configuration.build_file_location
    external_scm_type      = each.value.scm_configuration.external_scm_type
    is_automerge_enabled   = each.value.scm_configuration.is_automerge_enabled
    oci_code_repository_id = each.value.scm_configuration.oci_code_repository_id
    pat_secret_id          = each.value.scm_configuration.pat_secret_id
    repository_url         = each.value.scm_configuration.repository_url
    scm_type               = each.value.scm_configuration.scm_type
    username               = each.value.scm_configuration.username
  }

  verify_configuration {
    additional_parameters = each.value.verify_configuration.additional_parameters
    build_service_type    = each.value.verify_configuration.build_service_type
    jenkins_url           = each.value.verify_configuration.jenkins_url
    job_name              = each.value.verify_configuration.job_name
    pat_secret_id         = each.value.verify_configuration.pat_secret_id
    pipeline_id           = each.value.verify_configuration.pipeline_id
    repository_url        = each.value.verify_configuration.repository_url
    trigger_secret_id     = each.value.verify_configuration.trigger_secret_id
    username              = each.value.verify_configuration.username
    workflow_name         = each.value.verify_configuration.workflow_name
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

