class ntp {
  package { 'ntp':
    name   => "ntp",
    ensure => present
  }

  service { 'ntp-services':
    name   => "ntp",
    ensure => running,
    require => Package[ntp] 
  }
}
