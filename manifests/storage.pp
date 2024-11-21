class role::storage {
  notify { 'role::storage is DEPRECATED':
    message => 
      'role::storage is deprecated. role::ceph::storage should be used instead',
  }

  include ::role::ceph::storage
}
