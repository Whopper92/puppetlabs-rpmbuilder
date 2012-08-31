require 'spec_helper'

describe 'rpmbuilder::mock::pe_mocks', :type => 'class' do

  context 'Each Puppet Labs Enterprise mock configuration file should be present' do

  streamlined_configs = [
    'pupent-1.1-el-5-i386-cve',
    'pupent-1.1-el-5-x86_64-cve',
    'pupent-1.1-el-6-i386-cve',
    'pupent-1.1-el-6-x86_64-cve',
    'pupent-1.2-el-5-i386-cve',
    'pupent-1.2-el-5-x86_64-cve',
    'pupent-1.2-el-6-i386-cve',
    'pupent-1.2-el-6-x86_64-cve',
    'pupent-2.0-el-5-i386-cve',
    'pupent-2.0-el-5-x86_64-cve',
    'pupent-2.0-el-6-i386-cve',
    'pupent-2.0-el-6-x86_64-cve',
    'pupent-2.5-el-5-i386',
    'pupent-2.5-el-5-x86_64',
    'pupent-2.5-el-6-i386',
    'pupent-2.5-el-6-x86_64',
  ]

  other_configs = [
    'pupent-fc-15-i386.cfg',
    'pupent-fc-15-x86_64.cfg',
    'pupent-1.1-el-4-i386-cve.cfg',
    'pupent-1.1-el-4-x86_64-cve.cfg',
    'pupent-1.2-el-4-i386-cve.cfg',
    'pupent-1.2-el-4-x86_64-cve.cfg',
    'pupent-2.0-el-4-i386-cve.cfg',
    'pupent-2.0-el-4-x86_64-cve.cfg',
    'pupent-2.5-el-4-i386.cfg',
    'pupent-2.5-el-4-x86_64.cfg',
    'pupent-extras-el-5-i386.cfg',
    'pupent-extras-el-5-x86_64.cfg',
    'pupent-extras-el-6-i386.cfg',
    'pupent-extras-el-6-x86_64.cfg',
  ]

    streamlined_configs.each do|config|
      it { should contain_Rpmbuilder__mock__Create_mock("#{config}")  }
    end

    other_configs.each do|config|
      it { should contain_Rpmbuilder__mock__Config("#{config}")  }
    end
  end
end
