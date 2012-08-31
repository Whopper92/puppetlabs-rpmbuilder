class rpmbuilder::mock::pe_mocks {

  $mock_path = '/etc/mock'
  Package<| title == 'mock' |> -> Rpmbuilder::Mock::Config<| |>
  Package<| title == 'mock' |> -> Rpmbuilder::Mock::Create_mock<| |>

  rpmbuilder::mock::create_mock { 'pupent-1.1-el-5-i386-cve':   is_enterprise => true}
  rpmbuilder::mock::create_mock { 'pupent-1.1-el-5-x86_64-cve': is_enterprise => true}
  rpmbuilder::mock::create_mock { 'pupent-1.1-el-6-i386-cve':   is_enterprise => true}
  rpmbuilder::mock::create_mock { 'pupent-1.1-el-6-x86_64-cve': is_enterprise => true}
  rpmbuilder::mock::create_mock { 'pupent-1.2-el-5-i386-cve':   is_enterprise => true}
  rpmbuilder::mock::create_mock { 'pupent-1.2-el-5-x86_64-cve': is_enterprise => true}
  rpmbuilder::mock::create_mock { 'pupent-1.2-el-6-i386-cve':   is_enterprise => true}
  rpmbuilder::mock::create_mock { 'pupent-1.2-el-6-x86_64-cve': is_enterprise => true}
  rpmbuilder::mock::create_mock { 'pupent-2.0-el-5-i386-cve':   is_enterprise => true}
  rpmbuilder::mock::create_mock { 'pupent-2.0-el-5-x86_64-cve': is_enterprise => true}
  rpmbuilder::mock::create_mock { 'pupent-2.0-el-6-i386-cve':   is_enterprise => true}
  rpmbuilder::mock::create_mock { 'pupent-2.0-el-6-x86_64-cve': is_enterprise => true}
  rpmbuilder::mock::create_mock { 'pupent-2.5-el-5-i386':       is_enterprise => true}
  rpmbuilder::mock::create_mock { 'pupent-2.5-el-5-x86_64':     is_enterprise => true}
  rpmbuilder::mock::create_mock { 'pupent-2.5-el-6-i386':       is_enterprise => true}
  rpmbuilder::mock::create_mock { 'pupent-2.5-el-6-x86_64':     is_enterprise => true}

  rpmbuilder::mock::config { 'pupent-fc-15-i386.cfg':
    config             => "${mock_path}/pupent-fc15-i386.cfg",
    build_root         => 'pupent-fc-15-i386',
    target_arch        => 'i386',
    legal_host_arches  => 'i386',
    dist               => 'fc15',
    base_repo_baseurl  => 'http://localhost/os/fc/15/i386',
    pe_repo_baseurl    => 'file:///tmp/output/pe/fc/15/i386',
  }

  rpmbuilder::mock::config { 'pupent-fc-15-x86_64.cfg':
    config             => "${mock_path}/pupent-fc-15-x86_64.cfg",
    build_root         => 'pupent-fc-15-x86_64',
    target_arch        => 'x86_64',
    legal_host_arches  => 'x86_64',
    dist               => 'fc15',
    base_repo_baseurl  => 'http://localhost/os/fc/15/x86_64',
    pe_repo_baseurl    => 'file:///tmp/output/pe/fc/15/x86_64',
  }

  rpmbuilder::mock::config { 'pupent-1.1-el-4-i386-cve.cfg':
    config             => "${mock_path}/pupent-1.1-el-4-i386-cve.cfg",
    build_root         => 'pupent-1.1-el-4-i386-cve',
    target_arch        => 'i386',
    dist               => 'el4',
    macro_opts      => {
        dist        => { 'macro' => '%dist', 'val' => '.el4'  },
    },
    base_repo_baseurl  => 'http://vault.centos.org/4.9/os/i386',
    pe_repo_baseurl    => 'http://neptune.puppetlabs.lan/1.1/repos/el-4-i386',
  }

  rpmbuilder::mock::config { 'pupent-1.1-el-4-x86_64-cve.cfg':
    config             => "${mock_path}/pupent-1.1-el-4-x86_64-cve.cfg",
    build_root         => 'pupent-1.1-el-4-x86_64-cve',
    target_arch        => 'x86_64',
    dist               => 'el4',
    macro_opts      => {
        dist        => { 'macro' => '%dist', 'val' => '.el4'  },
    },
    base_repo_baseurl  => 'http://vault.centos.org/4.9/os/x86_64/',
    pe_repo_baseurl    => 'http://neptune.puppetlabs.lan/1.1/repos/el-4-x86_64',
  }

  rpmbuilder::mock::config { 'pupent-1.2-el-4-i386-cve.cfg':
    config             => "${mock_path}/pupent-1.2-el-4-i386-cve.cfg",
    build_root         => 'pupent-1.2-el-4-i386-cve',
    target_arch        => 'i386',
    dist               => 'el4',
    macro_opts      => {
        dist        => { 'macro' => '%dist', 'val' => '.el4'  },
    },
    base_repo_baseurl  => 'http://vault.centos.org/4.9/os/i386/',
    pe_repo_baseurl    => 'http://neptune.puppetlabs.lan/1.2/repos/el-4-i386',
  }

  rpmbuilder::mock::config { 'pupent-1.2-el-4-x86_64-cve.cfg':
    config             => "${mock_path}/pupent-1.2-el-4-x86_64-cve.cfg",
    build_root         => 'pupent-1.2-el-4-x86_64-cve',
    target_arch        => 'x86_64',
    dist               => 'el4',
    macro_opts      => {
        dist        => { 'macro' => '%dist', 'val' => '.el4'  },
    },
    base_repo_baseurl  => 'http://vault.centos.org/4.9/os/x86_64/',
    pe_repo_baseurl    => 'http://neptune.puppetlabs.lan/1.2/repos/el-4-x86_64',
  }

  rpmbuilder::mock::config { 'pupent-2.0-el-4-i386-cve.cfg':
    config             => "${mock_path}/pupent-2.0-el-4-i386-cve.cfg",
    build_root         => 'pupent-2.0-el-4-i386-cve',
    target_arch        => 'x86_64',
    dist               => 'el4',
    macro_opts      => {
        dist        => { 'macro' => '%dist', 'val' => '.el4'  },
    },
    base_repo_baseurl  => 'http://vault.centos.org/4.9/os/i386/',
    pe_repo_baseurl    => 'http://neptune.puppetlabs.lan/2.0/repos/el-4-i386',
  }

  rpmbuilder::mock::config { 'pupent-2.0-el-4-x86_64-cve.cfg':
    config             => "${mock_path}/pupent-2.0-el-4-x86_64-cve.cfg",
    build_root         => 'pupent-2.0-el-4-x86_64-cve',
    target_arch        => 'x86_64',
    dist               => 'el4',
    macro_opts      => {
        dist        => { 'macro' => '%dist', 'val' => '.el4'  },
    },
    base_repo_baseurl  => 'http://vault.centos.org/4.9/os/x86_64/',
    pe_repo_baseurl    => 'http://neptune.puppetlabs.lan/2.0/repos/el-4-x86_64',
  }

  rpmbuilder::mock::config { 'pupent-2.5-el-4-i386.cfg':
    config             => "${mock_path}/pupent-2.5-el-4-i386-cve.cfg",
    build_root         => 'pupent-2.5-el-4-i386-cve',
    target_arch        => 'i386',
    dist               => 'el4',
    macro_opts      => {
        dist        => { 'macro' => '%dist', 'val' => '.el4'  },
    },
    base_repo_baseurl  => 'http://vault.centos.org/4.9/os/i386/',
    pe_repo_baseurl    => 'http://neptune.puppetlabs.lan/2.5/repos/el-4-i386',
  }

  rpmbuilder::mock::config { 'pupent-2.5-el-4-x86_64.cfg':
    config             => "${mock_path}/pupent-2.5-el-4-x86_64-cve.cfg",
    build_root         => 'pupent-2.5-el-4-x86_64-cve',
    target_arch        => 'x86_64',
    dist               => 'el4',
    macro_opts      => {
        dist        => { 'macro' => '%dist', 'val' => '.el4'  },
    },
    base_repo_baseurl  => 'http://vault.centos.org/4.9/os/x86_64/',
    pe_repo_baseurl    => 'http://neptune.puppetlabs.lan/2.5/repos/el-4-x86_64',
  }

  rpmbuilder::mock::config { 'pupent-extras-el-5-i386.cfg':
    config                  => "${mock_path}/pupent-extras-el-5-i386.cfg",
    build_root              => 'pupent-extras-el-5-i386',
    target_arch             => 'i386',
    dist                    => 'el5',
    macro_opts      => {
        dist        => { 'macro' => '%dist', 'val' => '.el5'  },
    },
    base_repo_baseurl       => 'http://yo.puppetlabs.lan/cent5latestserver-i386/RPMS.os',
    pe_repo_baseurl         => 'http://neptune.puppetlabs.lan/2.5/repos/el-5-i386/',
    pe_extras_repo_baseurl  => 'http://neptune.puppetlabs.lan/2.5/repos/yum-enterprise/el/5/extras/i386',
  }

  rpmbuilder::mock::config { 'pupent-extras-el-5-x86_64.cfg':
    config                  => "${mock_path}/pupent-extras-el-5-x86_64.cfg",
    build_root              => 'pupent-extras-el-5-x86_64',
    target_arch             => 'x86_64',
    dist                    => 'el5',
    macro_opts      => {
        dist        => { 'macro' => '%dist', 'val' => '.el5'  },
    },
    base_repo_baseurl       => 'http://yo.puppetlabs.lan/cent5latestserver-x86_64/RPMS.os',
    pe_repo_baseurl         => 'http://neptune.puppetlabs.lan/2.5/repos/el-5-x86_64',
    pe_extras_repo_baseurl  => 'http://neptune.puppetlabs.lan/2.5/repos/yum-enterprise/el/5/extras/x86_64',
  }

  rpmbuilder::mock::config { 'pupent-extras-el-6-i386.cfg':
    config                  => "${mock_path}/pupent-extras-el-6-i386.cfg",
    build_root              => 'pupent-extras-el-6-i386',
    target_arch             => 'i386',
    dist                    => 'el6',
    base_mirrorlist         => 'http://mirrorlist.centos.org/?release=6&arch=i386&repo=os',
    pe_repo_baseurl         => 'http://neptune.puppetlabs.lan/2.5/repos/el-6-i386',
    pe_extras_repo_baseurl  => 'http://neptune.puppetlabs.lan/2.5/repos/yum-enterprise/el/6/extras/i386',
  }

  rpmbuilder::mock::config { 'pupent-extras-el-6-x86_64.cfg':
    config                  => "${mock_path}/pupent-extras-el-6-x86_64.cfg",
    build_root              => 'pupent-extras-el-6-x86_64',
    target_arch             => 'x86_64',
    dist                    => 'el6',
    base_repo_baseurl       => 'http://yo.puppetlabs.lan/cent6latestserver-x86_64/RPMS.os',
    pe_repo_baseurl         => 'http://neptune.puppetlabs.lan/2.5/repos/el-6-x86_64',
    pe_extras_repo_baseurl  => 'http://neptune.puppetlabs.lan/2.5/repos/yum-enterprise/el/6/extras/x86_64',
  }
}
