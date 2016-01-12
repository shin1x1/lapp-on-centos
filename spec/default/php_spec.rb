require 'spec_helper'

describe command('php -v') do
  its(:stdout) { should match /PHP 7\./ }
  its(:stdout) { should match /with Zend OPcache/ }
end

describe 'PHP config parameters' do
  context php_config('date.timezone') do
    its(:value) { should eq 'Asia/Tokyo' }
  end

  context php_config('log_errors') do
    its(:value) { should eq 1 }
  end

  context php_config('display_errors') do
    its(:value) { should eq 1 }
  end
  context php_config('display_startup_errors') do
    its(:value) { should eq 1 }
  end
  context php_config('error_reporting') do
    its(:value) { should eq 32767 }
  end

  PHP_LOG_FILE = '/var/log/php.log'
  context php_config('error_log') do
    its(:value) { should eq PHP_LOG_FILE }
  end
  context file(PHP_LOG_FILE) do
    it { should be_file }
    it { should be_mode 666 }
  end
  context file('/etc/logrotate.d/php') do
    it { should be_file }
  end

  # xdebug
  context php_config('xdebug.remote_enable') do
    its(:value) { should eq 1 }
  end
  context php_config('xdebug.remote_autostart') do
    its(:value) { should eq 1 }
  end
  context php_config('xdebug.remote_host') do
    its(:value) { should_not eq '' }
  end
  context file('/home/vagrant/.bashrc') do
    it { should contain 'export PHP_IDE_CONFIG="serverName=' }
  end
end