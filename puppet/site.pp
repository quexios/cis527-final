
node default {

  package { ['docker.io', 'docker-compose-v2', 'ufw']:
    ensure => installed,
  }

  service { 'docker':
    ensure  => running,
    enable  => true,
    require => Package['docker.io'],
  }

  exec { 'allow-ssh':
    command => '/usr/sbin/ufw allow 22/tcp',
    unless  => '/usr/sbin/ufw status | grep "22/tcp.*ALLOW"',
    require => Package['ufw'],
  }

  exec { 'allow-http':
    command => '/usr/sbin/ufw allow 80/tcp',
    unless  => '/usr/sbin/ufw status | grep "80/tcp.*ALLOW"',
    require => Package['ufw'],
  }

  exec { 'allow-backend':
    command => '/usr/sbin/ufw allow 3000/tcp',
    unless  => '/usr/sbin/ufw status | grep "3000/tcp.*ALLOW"',
    require => Package['ufw'],
  }

  exec { 'enable-ufw':
    command => '/usr/sbin/ufw --force enable',
    unless  => '/usr/sbin/ufw status | grep "Status: active"',
    require => [Exec['allow-ssh'], Exec['allow-http']],
  }
}