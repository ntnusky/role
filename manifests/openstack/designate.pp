class role::openstack::designate {
  # Baseconfiguration. Should be on all hosts.
  include ::profile::baseconfig
  include ::profile::baseconfig::users

  # Install the openstack designate server
  include ::ntnuopenstack::designate
}
