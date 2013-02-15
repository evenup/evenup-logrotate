require 'spec_helper'
 
describe 'logrotate', :type => :class do

  context "when called with default parameters" do

    it { should create_class('logrotate') }
    
    it { should create_package('logrotate') }
    
    it { should create_file('/etc/logrotate.d').with_ensure('directory') }

  end

end

