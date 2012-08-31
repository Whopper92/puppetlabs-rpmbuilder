class rpmbuilder::mock::puppetlabs_mocks {

  Package<| title == 'mock' |> -> Rpmbuilder::Mock::Create_mock<| |>

  rpmbuilder::mock::create_mock { 'pl-el-5-i386':
    failover_priority => 'base',
    include_epel      => 'true',
  }

  rpmbuilder::mock::create_mock { 'pl-el-5-i386-dev':
    failover_priority    => 'base',
    include_epel      => 'true',
  }

  rpmbuilder::mock::create_mock { 'pl-el-5-x86_64':
    failover_priority     => 'base',
    include_epel      => 'true',
  }

  rpmbuilder::mock::create_mock { 'pl-el-5-x86_64-dev':
    failover_priority     => 'base',
    include_epel      => 'true',
  }

  rpmbuilder::mock::create_mock { 'pl-el-6-i386':
    failover_priority     => 'base',
    include_epel      => 'true',
  }

  rpmbuilder::mock::create_mock { 'pl-el-6-i386-dev':
    failover_priority     => 'base',
    include_epel      => 'true',
  }

  rpmbuilder::mock::create_mock { 'pl-el-6-x86_64':
    failover_priority     => 'base',
    include_epel      => 'true',
  }

  rpmbuilder::mock::create_mock { 'pl-el-6-x86_64-dev':
    failover_priority     => 'base',
    include_epel      => 'true',
  }

  rpmbuilder::mock::create_mock { 'pl-fc-15-i386':       }
  rpmbuilder::mock::create_mock { 'pl-fc-15-i386-dev':   }
  rpmbuilder::mock::create_mock { 'pl-fc-15-x86_64':     }
  rpmbuilder::mock::create_mock { 'pl-fc-15-x86_64-dev': }
  rpmbuilder::mock::create_mock { 'pl-fc-16-i386':       }
  rpmbuilder::mock::create_mock { 'pl-fc-16-i386-dev':   }
  rpmbuilder::mock::create_mock { 'pl-fc-16-x86_64':     }
  rpmbuilder::mock::create_mock { 'pl-fc-16-x86_64-dev': }
  rpmbuilder::mock::create_mock { 'pl-fc-17-i386':       }
  rpmbuilder::mock::create_mock { 'pl-fc-17-i386-dev':   }
  rpmbuilder::mock::create_mock { 'pl-fc-17-x86_64':     }
  rpmbuilder::mock::create_mock { 'pl-fc-17-x86_64-dev': }
}
