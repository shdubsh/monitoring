# == Class: monitoring::monitor::reading_web
#
# Monitor the following Reading Web Grafana dashboards:
#
# * Page Previews Dashboard <grafana.wikimedia.org/dashboard/db/reading-web-page-previews>
class monitoring::monitor::reading_web {
    monitoring::grafana_alert { 'db/reading-web-page-previews':
        contact_group => 'team-reading-web',
    }
}
