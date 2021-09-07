 
resource "datadog_monitor" "cpumonitor" {
  name = "cpu monitor"
  type = "metric alert"
  message = "CPU usage alert"
  query = "avg(last_1m):avg:system.cpu.system{*} by {host} > 60"
  thresholds = {
    ok = 20
    warning = 50
    critical = 60
  }
}