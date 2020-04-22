# This class installs a neutron bgp agent node 
class role::openstack::neutron::bgp {
  include ::profile::baseconfig
  include ::profile::baseconfig::users
  include ::ntnuopenstack::neutron::bgp
}
