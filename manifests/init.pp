# Class: logrotate
#
# This module manages logrotate and logrotate.d files
#
# Sample Usage:
#   include logrotate
#
class logrotate {

  package {
    'logrotate':
      ensure  => 'installed';
  }

# TODO - import all logrotate configs into puppet, add purge => true?
  file {
    '/etc/logrotate.d':
      ensure  => 'directory',
      owner   => 'root',
      group   => 'root',
      mode    => '0755',
      require => Package['logrotate'];
  }
}
