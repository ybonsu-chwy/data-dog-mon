resource "datadog_monitor" "default" {
  for_each = local.enabled ? var.datadog_monitors : {}

  name                = each.value.name
  type                = each.value.type
  query               = each.value.query
  message             = format("%s%s", each.value.message, local.alert_tags)
  escalation_message  = lookup(each.value, "escalation_message", null)
  require_full_window = lookup(each.value, "require_full_window", null)
  notify_no_data      = lookup(each.value, "notify_no_data", null)
  new_host_delay      = lookup(each.value, "new_host_delay", null)
  evaluation_delay    = lookup(each.value, "evaluation_delay", null)
  no_data_timeframe   = lookup(each.value, "no_data_timeframe", null)
  renotify_interval   = lookup(each.value, "renotify_interval", null)
  notify_audit        = lookup(each.value, "notify_audit", null)
  timeout_h           = lookup(each.value, "timeout_h", null)
  include_tags        = lookup(each.value, "include_tags", null)
  enable_logs_sample  = lookup(each.value, "enable_logs_sample", null)
  force_delete        = lookup(each.value, "force_delete", null)

  monitor_thresholds {
    warning           = lookup(each.value.thresholds, "warning", null)
    warning_recovery  = lookup(each.value.thresholds, "warning_recovery", null)
    critical          = lookup(each.value.thresholds, "critical", null)
    critical_recovery = lookup(each.value.thresholds, "critical_recovery", null)
    ok                = lookup(each.value.thresholds, "ok", null)
    unknown           = lookup(each.value.thresholds, "unknown", null)
  }
}
