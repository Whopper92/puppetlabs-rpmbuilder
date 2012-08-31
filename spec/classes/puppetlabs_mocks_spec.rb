require 'spec_helper'

describe 'rpmbuilder::mock::puppetlabs_mocks', :type => 'class' do

  context 'Each Puppet Labs mock configuration file should be present' do

  configs = [
    'pl-el-5-i386',
    'pl-el-5-i386-dev',
    'pl-el-5-x86_64',
    'pl-el-5-x86_64-dev',
    'pl-el-6-i386',
    'pl-el-6-i386-dev',
    'pl-el-6-x86_64',
    'pl-el-6-x86_64-dev',
    'pl-fc-15-i386',
    'pl-fc-15-x86_64',
    'pl-fc-15-x86_64-dev',
    'pl-fc-16-i386',
    'pl-fc-16-i386-dev',
    'pl-fc-16-x86_64',
    'pl-fc-17-i386',
    'pl-fc-17-i386-dev',
    'pl-fc-17-x86_64',
    'pl-fc-17-x86_64-dev'
  ]

    configs.each do|config|
      it { should contain_Rpmbuilder__Mock__Create_mock("#{config}")  }
    end
  end
end

