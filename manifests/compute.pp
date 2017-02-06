class role::compute {
  # Baseconfiguration. Should be on all hosts.
  include ::profile::baseconfig
  include ::profile::baseconfig::users

  # Storage
  include ::profile::ceph::client

  # Openstack compute
  include ::profile::openstack::neutronagent
  include ::profile::openstack::novacompute
  include ::profile::munin::plugin::compute

  # Monitoring
  #include ::profile::monitoring::logstashforwarder
  #include ::profile::monitoring::icingaclient
  include ::profile::munin::node
}
