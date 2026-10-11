variable "adm_remediation_recipes" {
  description = <<EOT
Map of adm_remediation_recipes, attributes below
Required:
    - compartment_id
    - is_run_triggered_on_kb_change
    - knowledge_base_id
    - detect_configuration (block):
        - exclusions (optional)
        - max_permissible_cvss_v2score (optional)
        - max_permissible_cvss_v3score (optional)
        - max_permissible_severity (optional)
        - upgrade_policy (optional)
    - network_configuration (block):
        - nsg_ids (optional)
        - subnet_id (required)
    - scm_configuration (block):
        - branch (required)
        - build_file_location (optional)
        - external_scm_type (optional)
        - is_automerge_enabled (required)
        - oci_code_repository_id (optional)
        - pat_secret_id (optional)
        - repository_url (optional)
        - scm_type (required)
        - username (optional)
    - verify_configuration (block):
        - additional_parameters (optional)
        - build_service_type (required)
        - jenkins_url (optional)
        - job_name (optional)
        - pat_secret_id (optional)
        - pipeline_id (optional)
        - repository_url (optional)
        - trigger_secret_id (optional)
        - username (optional)
        - workflow_name (optional)
Optional:
    - defined_tags
    - display_name
    - freeform_tags
    - state
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    compartment_id                = string
    is_run_triggered_on_kb_change = bool
    knowledge_base_id             = string
    defined_tags                  = optional(map(string))
    display_name                  = optional(string)
    freeform_tags                 = optional(map(string))
    state                         = optional(string)
    detect_configuration = object({
      exclusions                   = optional(list(string))
      max_permissible_cvss_v2score = optional(number)
      max_permissible_cvss_v3score = optional(number)
      max_permissible_severity     = optional(string)
      upgrade_policy               = optional(string)
    })
    network_configuration = object({
      nsg_ids   = optional(set(string))
      subnet_id = string
    })
    scm_configuration = object({
      branch                 = string
      build_file_location    = optional(string)
      external_scm_type      = optional(string)
      is_automerge_enabled   = bool
      oci_code_repository_id = optional(string)
      pat_secret_id          = optional(string)
      repository_url         = optional(string)
      scm_type               = string
      username               = optional(string)
    })
    verify_configuration = object({
      additional_parameters = optional(map(string))
      build_service_type    = string
      jenkins_url           = optional(string)
      job_name              = optional(string)
      pat_secret_id         = optional(string)
      pipeline_id           = optional(string)
      repository_url        = optional(string)
      trigger_secret_id     = optional(string)
      username              = optional(string)
      workflow_name         = optional(string)
    })
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.adm_remediation_recipes : (
        contains([for v in ["EXTERNAL_SCM", "OCI_CODE_REPOSITORY"] : lower(v)], lower(v.scm_configuration.scm_type))
      )
    ])
    error_message = "must be one of: \"EXTERNAL_SCM\", \"OCI_CODE_REPOSITORY\""
  }
  validation {
    condition = alltrue([
      for k, v in var.adm_remediation_recipes : (
        contains([for v in ["GITHUB_ACTIONS", "GITLAB_PIPELINE", "JENKINS_PIPELINE", "NONE", "OCI_DEVOPS_BUILD"] : lower(v)], lower(v.verify_configuration.build_service_type))
      )
    ])
    error_message = "must be one of: \"GITHUB_ACTIONS\", \"GITLAB_PIPELINE\", \"JENKINS_PIPELINE\", \"NONE\", \"OCI_DEVOPS_BUILD\""
  }
  validation {
    condition = alltrue([
      for k, v in var.adm_remediation_recipes : (
        v.state == null || (contains([for v in ["INACTIVE", "ACTIVE"] : lower(v)], lower(v.state)))
      )
    ])
    error_message = "must be one of: \"INACTIVE\", \"ACTIVE\""
  }
}

