# VM-Configuration of an ambari agent that is monitored by the ambari server.

# Turn off interfering services
include interfering_services

# Install and enable ntp
include ntp

# Ensure that servers can find themselves even in absence of dns
class { 'etchosts':
  ownhostname => 'one.cluster'
}


class { 'ambari_agent':
  serverhostname => "one.cluster",
  ownhostname    => "two.cluster"
}

exec { 'apt-get-update':
  command     => '/usr/bin/apt-get update'
}

# Establish ordering
Class['interfering_services'] -> Class['ntp'] -> Class['etchosts'] -> Class['ambari_agent']

