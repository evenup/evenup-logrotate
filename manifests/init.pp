# Class: logrotate
#
# This module manages logrotate and logrotate.d files
#
# Sample Usage:
#   include logrotate
#
class logrotate (
  $rotate_every = 'weekly', # daily, weekly, monthly
  $rotate = 4,
  $compress = 'compress',
  $options = []
) {

  package { 'logrotate':
    ensure  => 'installed';
  }

# TODO - import all logrotate configs into puppet, add purge => true?
  file { '/etc/logrotate.d':
    ensure  => 'directory',
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    require => Package['logrotate'],
  }

  file { '/etc/logrotate.conf':
    ensure  => 'file',
    owner   => 'root',
    group   => 'root',
    mode    => '0444',
    content => template('logrotate/logrotate.conf.erb'),
    require => Package['logrotate'],
  }
}
