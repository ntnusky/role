class role::compute {
  # Baseconfiguration. Should be on all hosts.
  include ::profile::baseconfig
  include ::profile::baseconfig::users

  # Storage
  include ::profile::ceph::client

  # Openstack compute
  include ::profile::openstack::neutron::compute
  include ::profile::openstack::novacompute

  # Monitoring
  #include ::profile::monitoring::logstashforwarder
}
