define proftpd::instance::ftp(
  $ipaddress='0.0.0.0',
  $port='21',
  $server_name='FTP server',
  $server_ident='FTP server ready',
  $server_admin='sype@beezzonline.com',
  $logdir=undef,
  $max_clients='45',
  $max_loginattempts='3',
  $default_root='~',
  $allowoverwrite='on',
  $passive_ports='60000 65535',
  $authentication='file',
  $mysql_host=undef,
  $mysql_user=undef,
  $mysql_pass=undef,
  $mysql_db=undef
) {

  include proftpd

  $protocol = 'ftp'

  if ($logdir == undef) {
    fail("Proftpd::Instance::Ftp[${title}]: parameter logdir must be defined")
  }

  $vhost_name = "${server_name}"

  if ! defined(File["${logdir}/proftpd"]) {
    file { "${logdir}/proftpd":
      ensure  => directory,
      owner   => 'proftpd',
      group   => 'proftpd',
    }
  }

  file { "${logdir}/proftpd/ftp":
    ensure  => directory,
    owner   => 'proftpd',
    group   => 'proftpd',
    require => File["${logdir}/proftpd"],
    notify  => Service['proftpd']
  }

  file { "/etc/proftpd/sites.d/${vhost_name}.conf":
    ensure  => file,
    owner   => root,
    group   => root,
    mode    => '0644',
    content => template("${module_name}/sites.d/ftp.conf.erb"),
    notify  => Service['proftpd']
  }

  file { "/etc/proftpd/users.d/${vhost_name}.conf":
    ensure  => file,
    owner   => root,
    group   => root,
    mode    => '0644',
    content => template("${module_name}/users.d/users.conf.erb"),
    notify  => Service['proftpd']
  }

  if $authentication == 'file' {
    file { "/etc/proftpd/users.d/${vhost_name}.passwd":
      ensure  => file,
      owner   => root,
      group   => root,
      mode    => '0644',
      replace => false
    }



    file { "/etc/proftpd/users.d/${vhost_name}.group":
      ensure  => file,
      owner   => root,
      group   => root,
      mode    => '0644',
      replace => false
    }
  }

}
