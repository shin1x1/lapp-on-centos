require 'spec_helper'

describe file('/etc/sysconfig/i18n') do
  its(:content) { should match 'ja_JP.UTF-8' }
end

