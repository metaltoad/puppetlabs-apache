class apache::mod::proxy (
  $proxy_requests = 'Off',
  $allow_from = undef,
  $apache_version = $::apache::apache_version,
) {
  ::apache::mod { 'proxy': }
  # Template uses $proxy_requests, $apache_version
  file { 'proxy.conf':
    ensure  => file,
    path    => "/etc/httpd/conf.d/proxy.conf",
    content => template('apache/mod/proxy.conf.erb'),
    require => Exec["mkdir /etc/httpd/conf.d"],
    before  => File['/etc/httpd/conf.d'],
    notify  => Class['apache::service'],
  }
}
