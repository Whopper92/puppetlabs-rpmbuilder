class rpmbuilder::packages::essential {

  $builder_pkgs = [
    'autoconf',
    'automake',
    'createrepo',
    'fedora-packager',
    'gcc',
    'make',
    'mock',
    'rpmdevtools',
    'rpm-libs',
    'rubygem-gem2rpm',
    'rubygem-rake',
    'rubygem-rspec',
    'yum',
    'yum-utils',
  ]

  package { $builder_pkgs:
     ensure  => installed,
     require => Class['rpmbuilder::repos'],
  }
  case $operatingsystem {
    'CentOS': {
        $gnupg_pkg = $os_maj_version ? {
          '5'     => 'gnupg',
          '6'     => 'gnupg2',
          default => undef,
        }

        package { "$gnupg_pkg":
           ensure   => installed,
           require  => Class['rpmbuilder::repos']
        }
     }
    'Fedora': {
        Package {
           require  => Class['rpmbuilder::repos']
        }

        package { 'rpm-sign': ensure => installed }
        package { 'keychain': ensure  => installed }
        package { 'gnupg': ensure  => installed }
    }
  }
}
