require 'spec_helper'

describe 'logrotate::file', :type => :define do

  let(:title) { 'foo' }

  context "when log => '/var/log/foo.log', options => [ 'compress', 'rotate 7' ]" do
    let(:params) { { 'log' => '/var/log/foo.log', 'options' => [ 'compress', 'rotate 7' ] } }

    it { should contain_file('/etc/logrotate.d/foo') }
    it { should contain_file('/etc/logrotate.d/foo').with_content(/\/var\/log\/foo.log/) }
    it { should contain_file('/etc/logrotate.d/foo').with_content(/compress/) }
    it { should contain_file('/etc/logrotate.d/foo').with_content(/rotate 7/) }
  end

  context "when log => '/var/log/foo.log', options => [ 'compress', 'missingok' ], postrate => '/etc/init.d/foo restart'" do
    let(:params) { { 'log' => '/var/log/foo.log', 'options' => [ 'compress', 'missingok' ], 'postrotate' => '/etc/init.d/foo restart' } }

    it { should contain_file('/etc/logrotate.d/foo') }
    it { should contain_file('/etc/logrotate.d/foo').with_content(/\/var\/log\/foo.log/) }
    it { should contain_file('/etc/logrotate.d/foo').with_content(/compress/) }
    it { should contain_file('/etc/logrotate.d/foo').with_content(/missingok/) }
    it { should contain_file('/etc/logrotate.d/foo').with_content(/postrotate\n\s\s\/etc\/init.d\/foo\srestart\nendscript\n/) }
  end

  context "when log => 'blah', options => 'blah', ensure => 'absent'" do
    let(:params) { { 'log' => 'blah', 'options' => 'blah', 'ensure' => 'absent' } }

    it { should contain_file('/etc/logrotate.d/foo').with_ensure('absent') }
  end


end
