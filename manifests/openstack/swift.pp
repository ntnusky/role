# Openstack swift role. Installs a ceph rados gateway, and registers it in
# keystone as a swift node.
class role::openstack::swift {
  # Baseconfiguration. Should be on all hosts.
  include ::profile::baseconfig
  include ::profile::baseconfig::users

  # Install the swift gateway 
  include ::ntnuopenstack::swift
}
