require 'spec_helper'

describe 'rpmbuilder::packages::essential', :type => 'class' do

  context "Packages which should be installed on every OS" do

    packages = [
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
    'yum-utils',]

    packages.each do|pkg|
      it { should contain_package("#{pkg}").with_ensure('installed') }
    end
  end

  context "On a Fedora OS" do
    let(:facts) {{ :operatingsystem => 'fedora' }}

    packages = [
    'rpm-sign',
    'keychain',
    'gnupg',]

    packages.each do|pkg|
       it { should contain_package("#{pkg}").with_ensure('installed') }
    end
  end
end
