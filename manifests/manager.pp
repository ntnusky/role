class role::manager {
  # Baseconfiguration. Should be on all hosts.
  include ::profile::baseconfig
  include ::profile::users
  
  # NFS server.
  include ::profile::nfs::server
}
