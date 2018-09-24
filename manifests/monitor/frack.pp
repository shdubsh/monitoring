class monitoring::monitor::frack {
  file { '/etc/nagios/nsca_frack.cfg':
    source  => "puppet:///modules/${module_name}/nsca_frack.cfg",
    mode    => '0444'
  }
}