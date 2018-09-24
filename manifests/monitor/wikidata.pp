# = Class: monitoring::monitor::wikidata
#
# Monitor wikidata dispatch lag
class monitoring::monitor::wikidata {
    @monitoring::host { 'www.wikidata.org':
        host_fqdn => 'www.wikidata.org',
    }

    monitoring::service { 'wikidata.org dispatch lag':
        description    => 'wikidata.org dispatch lag is higher than 600s',
        check_command  => 'check_wikidata',
        host           => 'www.wikidata.org',
        check_interval => 5,
        retry_interval => 1,
        contact_group  => 'admins,wikidata',
    }

    monitoring::service { 'wikidata.org dispatch extreme lag':
        description    => 'wikidata.org dispatch lag is REALLY high (>=4000s)',
        check_command  => 'check_wikidata_crit',
        host           => 'www.wikidata.org',
        check_interval => 5,
        retry_interval => 1,
        contact_group  => 'admins,wikidata',
    }
}
