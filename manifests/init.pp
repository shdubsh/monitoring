class monitoring (
  $default_plugins = [
    'check_puppetrun',
    'check_sysctl',
    'check_established_connections',
    'check-fresh-files-in-dir.py',
  ]
) {
  monitoring::service { 'ssh':
    description   => 'SSH',
    check_command => 'check_ssh',
  }

  $default_plugins.each |String $plugin| {
    file { "/usr/lib/nagios/plugins/${plugin}":
      source => "puppet:///modules/${module_name}/plugins/${plugin}",
      ensure => 'present',
      mode => '0555'
    }
  }

  file { '/usr/lib/nagios/plugins/check_eth':
    content => template("${module_name}/plugins/check_eth.erb"), # FIXME: this should be a regular plugin and not require a template.
    ensure  => 'present',
    mode    => '0555',
  }

  nrpe::monitor_service {'check_eth':
    description  => 'configured eth',
    nrpe_command => '/usr/local/lib/nagios/plugins/check_eth',
  }

  nrpe::monitor_service { 'check_dhclient':
    description  => 'dhclient process',
    nrpe_command => '/usr/lib/nagios/plugins/check_procs -w 0:0 -c 0:0 -C dhclient',
  }

  nrpe::monitor_service { 'disk_space':
    description  => 'Disk space',
    critical     => $nrpe_check_disk_critical,
    nrpe_command => "/usr/lib/nagios/plugins/check_disk ${nrpe_check_disk_options}",
  }

  nrpe::monitor_service { 'dpkg':
    description  => 'DPKG',
    nrpe_command => '/usr/local/lib/nagios/plugins/check_dpkg',
  }
  if ($::initsystem == 'systemd') {
    $ensure_monitor_systemd = $monitor_systemd ? {
      true    => present,
      false   => absent,
      default => present,
    }
    file { '/usr/local/lib/nagios/plugins/check_systemd_state':
      ensure => $ensure_monitor_systemd,
      source => 'puppet:///modules/base/check_systemd_state.py',
      owner  => 'root',
      group  => 'root',
      mode   => '0555',
    }
    nrpe::monitor_service { 'check_systemd_state':
      ensure       => $ensure_monitor_systemd,
      description  => 'Check systemd state',
      nrpe_command => '/usr/local/lib/nagios/plugins/check_systemd_state',
    }
  }
}