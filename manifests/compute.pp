class role::compute {
  # Baseconfiguration. Should be on all hosts.
  include ::profile::baseconfig
  include ::profile::users
  include ::profile::ceph::client
  include ::profile::norpf
  include ::profile::monitoring::logstashforwarder
#  include ::profile::monitoring::icingaclient

  # Openstack compute
  include ::profile::openstack::neutronagent
  include ::profile::openstack::novacompute
}
