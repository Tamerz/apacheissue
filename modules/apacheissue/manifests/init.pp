class apacheissue {

  class { 'apache':
    default_vhost => false,
  }

  apache::vhost { 'apacheissue non-ssl':
    servername      => $::fqdn,
    port            => '80',
    docroot         => '/var/www/html',
    redirect_status => 'permanent',
    redirect_dest   => "https://$::fqdn",
  }

  apache::vhost { 'apacheissue ssl':
    servername => $::fqdn,
    port       => '443',
    docroot    => '/var/www/html',
    ssl        => true,
  }
}
