class role::compute {
  # Baseconfiguration. Should be on all hosts.
  include ::profile::baseconfig
  include ::profile::ceph::client

  # Openstack compute
  include ::profile::openstack::neutronagent
  include ::profile::openstack::novacompute
}
