# == Class: monitoring::monitor::performance
#
# Monitor Performance
class monitoring::monitor::performance {
    monitoring::grafana_alert { 'db/webpagetest-alerts':
        contact_group => 'team-performance',
        notes_url     => 'https://phabricator.wikimedia.org/T203485',
    }

    monitoring::grafana_alert { 'db/navigation-timing-alerts':
        contact_group => 'team-performance',
        notes_url     => 'https://phabricator.wikimedia.org/T203485',
    }

    monitoring::grafana_alert { 'db/save-timing-alerts':
        contact_group => 'team-performance',
        notes_url     => 'https://phabricator.wikimedia.org/T203485',
    }

    monitoring::grafana_alert { 'db/resourceloader-alerts':
        contact_group => 'team-performance',
        notes_url     => 'https://phabricator.wikimedia.org/T203485',
    }

    monitoring::grafana_alert { 'db/webpagereplay-desktop-alerts':
        contact_group => 'team-performance',
        notes_url     => 'https://phabricator.wikimedia.org/T203485',
    }

    monitoring::grafana_alert { 'db/webpagereplay-mobile-alerts':
        contact_group => 'team-performance',
        notes_url     => 'https://phabricator.wikimedia.org/T203485',
    }
}
