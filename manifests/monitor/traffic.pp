# == Class: monitoring::monitor::traffic
#
# Monitor Traffic
class monitoring::monitor::traffic {
    monitoring::grafana_alert { 'db/varnish-http-requests':
    }
}
