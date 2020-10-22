# This role installs a stand-alone mysql server
class role::mysql::standalone {
  include ::profile::baseconfig
  include ::profile::baseconfig::users

  include ::profile::services::mysql::standalone
  include ::profile::services::dashboard::mysql

  # Create various databases for us
  include ::ntnuopenstack::databases
}
