define rpmbuilder::mock::create_mock (
  $failover_priority  = undef,
  $include_epel       = undef,
  $is_enterprise      = false
) {

  $mock_vars = split($name, '-')
  $mock_path = '/etc/mock'

  if $is_enterprise {
      $pe_version = $mock_vars[1]
      $dist       = $mock_vars[2]
      $release    = $mock_vars[3]
      $arch       = $mock_vars[4]
  } else {
      $dist       = $mock_vars[1]
      $release    = $mock_vars[2]
      $arch       = $mock_vars[3]
      $is_dev     = $mock_vars[4]
  }

  $os = "${dist}${release}"

  case $dist {
    'el': {
        case $release {
          /(4|5)/: {
            $macro_opts            = {
                dist        => { 'macro' => '%dist', 'val' => ".${dist}${release}"  },
                host_vendor => { 'macro' => '%_host_vendor', 'val' => 'Puppet Labs'  },
                rhel        => { 'macro' => '%rhel', 'val' => "${release}"  },
            }
          }
          6:  {
            $macro_opts            = {
                host_vendor => { 'macro' => '%_host_vendor', 'val' => 'Puppet Labs'  },
            }
          }
        }

        if $is_enterprise {
          $base_repo_baseurl   = "http://yo.puppetlabs.lan/cent${release}latestserver-${arch}/RPMS.os"
          $pe_repo_baseurl     = "http://neptune.puppetlabs.lan/${pe_version}/repos/${dist}-${release}-${arch}"
          $chroot_setup_cmd    = "install bash bzip2 coreutils cpio curl cvs diffutils\
 fedpkg findutils gawk gcc gcc-c++ gnupg grep gzip info make patch redhat-release\
 redhat-release-server redhat-rpm-config rpm-build sed shadow-utils tar unzip\
 util-linux-ng which xz buildsys-macros"
        } else {
          $base_repo_baseurl   = "http://mirrors.cat.pdx.edu/centos/${release}/os/${arch}"
          $chroot_setup_cmd    = 'groupinstall buildsys-build'
          $ccache_enable       = 'False'

          if $pe_version == 'extras' {
            $pe_extras_repo_baseurl = "http://neptune.puppetlabs.lan/2.5/repos/yum-enterprise/${dist}/${release}/extras/${arch}"
          }
       }

        $base_mirrorlist       = "http://mirrorlist.centos.org/?release=${release}&arch=${arch}&repo=os"
        $updates_mirrorlist    = "http://mirrorlist.centos.org/?release=${release}&arch=${arch}&repo=updates"
        $updates_repo_baseurl  = "http://mirrors.cat.pdx.edu/centos/${release}/updates/${arch}"
        if ! $is_enterprise {
          $puppet_prod_baseurl   = "http://yum.puppetlabs.com/${dist}/${release}/products/${arch}"
          $puppet_deps_baseurl   = "http://yum.puppetlabs.com/${dist}/${release}/dependencies/${arch}"
          $epel_repo_mirrorlist  = "http://mirrors.fedoraproject.org/mirrorlist?repo=epel-${release}&arch=${arch}"
        }

        if $is_dev {
          $puppet_dev_baseurl = "http://yum.puppetlabs.con/${dist}/${release}/devel/${arch}"
        } else {
          $puppet_dev_baseurl = undef
        }
    }

    'fc': {

        $macro_opts            = {
            host_vendor => { 'macro' => '%_host_vendor', 'val' => 'Puppet Labs'  },
        }

        $base_mirrorlist       = "http://mirrors.fedoraproject.org/mirrorlist?repo=fedora-${release}&arch=${arch}"
        $base_repo_baseurl     = "http://mirrors.cat.pdx.edu/fedora/linux/releases/${release}/Fedora/${arch}/os"
        $updates_mirrorlist    = "http://mirrors.fedoraproject.org/mirrorlist?repo=updates-released-f${release}&arch=${arch}"
        $updates_repo_baseurl  = "http://mirrors.cat.pdx.edu/fedora/linux/updates/${release}/${arch}"

        if ! $is_enterprise {
          $puppet_prod_baseurl   = "http://yum.puppetlabs.com/fedora/f${release}/products/${arch}"
          $puppet_deps_baseurl   = "http://yum.puppetlabs.com/fedora/f${release}/dependencies/${arch}"
        }

        if $is_dev {
          $puppet_dev_baseurl = "http://yum.puppetlabs.com/fedora/f${release}/devel/${arch}"
        } else {
          $puppet_dev_baseurl = undef
        }
    }
  }

  rpmbuilder::mock::config { "${name}.cfg":
    config                  => "${mock_path}/${name}.cfg",
    build_root              => $name,
    target_arch             => $arch,
    chroot_setup_cmd        => $chroot_setup_cmd,
    dist                    => $os,
    ccache_enable           => $ccache_enable,
    macro_opts              => $macro_opts,
    base_mirrorlist         => $base_mirrorlist,
    base_repo_baseurl       => $base_repo_baseurl,
    updates_mirrorlist      => $updates_mirrorlist,
    updates_repo_baseurl    => $updates_repo_baseurl,
    updates_repo_enabled    => '1',
    puppet_prod_baseurl     => $puppet_prod_baseurl,
    puppet_deps_baseurl     => $puppet_deps_baseurl,
    puppet_dev_baseurl      => $puppet_dev_baseurl,
    epel_repo_mirrorlist    => $epel_repo_mirrorlist,
    pe_repo_baseurl         => $pe_repo_baseurl,
    pe_extras_repo_baseurl  => $pe_extras_repo_baseurl,
    failover_priority       => $failover_priority,
  }
}
