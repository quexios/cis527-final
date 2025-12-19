node default {
  package { ['docker.io', 'docker-compose', 'ufw']:
    ensure => installed,
  }

  service { 'docker':
    ensure => running,
    enable => true,
  }

  exec { 'ufw-allow-http':
    command => '/usr/sbin/ufw allow 80/tcp',
    unless  => '/usr/sbin/ufw status | grep "80/tcp.*ALLOW"',
  }
}