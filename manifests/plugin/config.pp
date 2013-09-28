define mcollective::plugin::config(
  $config,
) {

  include mcollective::params

  concat::fragment { "${name} - plugin config":
    content => template("mcollective/plugin/config.cfg.erb"),
    order   => 30,
    target  => "${mcollective::params::configdir}/server.cfg",
  }

}
