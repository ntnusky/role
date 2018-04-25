# This role installs the cinder API, scheduler and volume-service on a node.
# When the cinder-volumes are ceph-backed we dont want dedicated volume nodes.
class role::openstack::cinder {
  # Baseconfiguration. Should be on all hosts.
  include ::profile::baseconfig
  include ::profile::baseconfig::users

  # Install the cinder service
  include ::profile::openstack::cinder
}
