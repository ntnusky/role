class role::compute {
  # Baseconfiguration. Should be on all hosts.
  include ::profile::baseconfig
  include ::profile::users
  include ::profile::norpf

  # Storage
  include ::profile::ceph::client

  # Openstack compute
  include ::profile::openstack::neutronagent
  include ::profile::openstack::novacompute
  include ::profile::users::nova

  # Monitoring
  #include ::profile::monitoring::logstashforwarder
  #include ::profile::monitoring::icingaclient
  include ::profile::munin::node
}
