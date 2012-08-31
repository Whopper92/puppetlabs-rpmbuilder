define rpmbuilder::mock::config (
  $config,
  $build_root,
  $target_arch,
  $legal_host_arches          = "'i386','i586','i686','x86_64'",
  $chroot_setup_cmd           = "groupinstall buildsys-build",
  $dist,
  $ccache_enable              = undef,
  $macro_opts                 = undef,
  $base_repo_baseurl          = undef,
  $base_mirrorlist            = undef,
  $updates_repo_baseurl       = undef,
  $updates_mirrorlist         = undef,
  $updates_repo_enabled       = '1',
  $puppet_prod_baseurl        = undef,
  $puppet_deps_baseurl        = undef,
  $puppet_dev_baseurl         = undef,
  $epel_repo_mirrorlist       = undef,
  $pe_repo_baseurl            = undef,
  $pe_extras_repo_baseurl     = undef,
  $failover_priority          = undef,
) {

  file { "${config}":
    ensure  => present,
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    content => template("rpmbuilder/mock-config.erb"),
    require => Package['mock'],
  }
}
