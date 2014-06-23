class mcollective::params(
  $connector_type       = 'activemq',
  $extra_libdirs        = [],
  $host                 = 'localhost',
  $logfile              = '/var/log/mcollective.log',
  $mcollective_loglevel = 'warn',
  $password             = '',
  $pool                 = [ {
    'host'     => 'localhost',
    'port'     => '61614',
    'user'     => 'mcollective',
    'password' => 'mcollective',
    'ssl'      => {},
    'type'     => 'activemq',
  } ],
  $port                 = '61614',
  $psk                  = '',
  $user                 = 'mcollective',
) {

  case $osfamily {
    'FreeBSD': {
      $sharedir        = '/usr/local/share/mcollective'
      $core_libdir     = $sharedir
      $configdir       = '/usr/local/etc/mcollective'
      $servicename     = 'mcollectived'
      $custom_sharedir = '/var/mcollective'

      $stomp_pkgname   = 'stomp'
      $stomp_provider  = 'gem'
    }
    'RedHat': {
      $sharedir        = '/usr/libexec/mcollective'
      $core_libdir     = $sharedir
      $configdir       = '/etc/mcollective'
      $servicename     = 'mcollective'
      $custom_sharedir = '/var/lib/mcollective'

      $stomp_pkgname   = 'rubygem-stomp'
      $stomp_provider  = 'yum'
    }
    default: {
      $sharedir        = '/usr/share/mcollective'
      $core_libdir     = "${sharedir}/plugins"
      $configdir       = '/etc/mcollective'
      $servicename     = 'mcollective'
      $custom_sharedir = '/var/lib/mcollective'

      $stomp_pkgname   = 'ruby-stomp'
      $stomp_provider  = 'apt'
    }
  }

  $custom_libdir = "${custom_sharedir}/plugins"

}
