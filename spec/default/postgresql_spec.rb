require 'spec_helper'

PACKAGE = 'postgresql-9.5'

describe service(PACKAGE) do
  it { should be_enabled }
  it { should be_running }
end

describe port(5432) do
  it { should be_listening }
end

describe command('psql -Upostgres -c \'SELECT version();\'') do
  its(:stdout) { should match /PostgreSQL 9\.5\./ }
end
