class role::openstack::designate::api {
  # Baseconfiguration. Should be on all hosts.
  include ::profile::baseconfig
  include ::profile::baseconfig::users

  # Install the openstack designate server
  include ::ntnuopenstack::designate::api
}
