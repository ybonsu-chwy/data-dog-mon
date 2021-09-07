 
resource "datadog_dashboard" "scotchbox_dashboard" {
  title         = "Scotchbox Dashboard"
  description   = "Created using the Datadog provider in Terraform"
  layout_type   = "ordered"
  is_read_only  = true

  widget {
    alert_value_definition {
      alert_id = " " #the ID of our recently  monitor
      precision = 3
      unit = "b"
      text_align = "center"
      title = "Host CPU Usage"
    }
  }

  widget {
    check_status_definition {
      check = "datadog.agent.up"
      grouping = "check"
      group = "host:scotchbox"
      title = "Host Availability"
      time = {
        live_span = "1h"
      }
    }
  }
}