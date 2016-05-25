require 'spec_helper'

describe file('/etc/apt/sources.list.d/zabbix-official.list') do
  it { should be_file }
end

describe package('zabbix-agent') do
  it { should be_installed }
end

describe service('zabbix-agent') do
  it { should be_enabled }
  it { should be_running }
end

describe file('/opt/zabbix/etc') do
  it { should be_directory }
end

describe file('/opt/zabbix/scripts') do
  it { should be_directory }
end

describe file('/opt/zabbix/templates') do
  it { should be_directory }
end

describe file('/etc/zabbix/zabbix_agentd.conf') do
  it { should be_file }
  it { should contain 'This file is generated by Chef' }
end

describe port(10_050) do
  it { should be_listening }
end

describe package('zabbixapi') do
  let(:path) { '/opt/chef/embedded/bin:$PATH' }
  it { should be_installed.by('gem') }
end

describe file('/var/lib/database') do
  it { should be_directory }
  it { should be_writable.by_user('mysql') }
  it { should be_mounted.with(options: { device: '/dev/mapper/shared-zabbix--database' }) }
end

describe package('zabbix-server-mysql') do
  it { should be_installed }
end

describe service('zabbix-server') do
  it { should be_enabled }
  it { should be_running }
end

describe file('/etc/zabbix/zabbix_server.conf') do
  it { should be_file }
  it { should contain 'generated by Chef' }
  it { should contain 'DBName=zabbix' }
  it { should contain 'DBPassword=fced396df30cc3590d8a0deeeaf3eb70' }
  it { should contain 'DBUser=zabbix' }
  it { should contain 'DBHost=127.0.0.1' }
  it { should contain 'DBPort=3306' }
  it { should contain 'ListenIP=0.0.0.0' }
end

describe port(10_051) do
  it { should be_listening }
end

describe package('php5-mysql') do
  it { should be_installed }
end

describe package('zabbix-frontend-php') do
  it { should be_installed }
end

describe file('/etc/php5/fpm/pool.d/zabbix.conf') do
  it { should be_file }
  it { should contain 'listen = 127.0.0.1:9200' }
end

describe port(9200) do
  it { should be_listening }
end

describe file('/etc/zabbix/web/zabbix.conf.php') do
  it { should be_file }
  it { should contain 'generated by Chef' }
  it { should contain 'MYSQL' }
  it { should contain '127.0.0.1' }
  it { should contain '3306' }
  it { should contain 'fced396df30cc3590d8a0deeeaf3eb70' }
  it { should contain 'localhost' }
  it { should contain '10051' }
end

describe file('/etc/nginx/sites-available/localhost.conf') do
  it { should be_file }
  it { should contain 'listen   80' }
  it { should contain 'server_name  localhost' }
  it { should contain 'fastcgi_pass    127.0.0.1:9200' }
end

describe port(80) do
  it { should be_listening }
end
