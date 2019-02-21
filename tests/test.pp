  yumrepo { 'repo-1':
    descr    => 'first repo',
    baseurl  => 'http://server1.enterprise.fr/repo-1
        http://server2.enterprise.fr/repo-1',
    enabled  => 0,
    target   => '/etc/yum.repos.d/enterprise.repo',
    provider => 'yum_target',
  }
  yumrepo { 'repo-2':
    descr    => 'second repo',
    baseurl  => 'http://server1.enterprise.fr/repo-2
        http://server2.enterprise.fr/repo-2',
    enabled  => 0,
    target   => '/etc/yum.repos.d/enterprise.repo',
    provider => 'yum_target',
  }

