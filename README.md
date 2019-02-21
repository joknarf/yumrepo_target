# yumrepo_target
yumrepo provider `yum_target` to implement the target parameter missing from puppetlabs resource yumrepo  
waiting too long that puppet implements this feature for years. 

works with puppet 6 and also with yumrepo_core module from the forge (puppet 4/5)  
put the module in a puppet environment then you can use the target parameter of yumrepo resource to put multiple repos in single repo file

```puppet
  test.pp:
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
```
```
# puppet apply -vt --environmentpath /etc/puppetlabs/code/environments test.pp
Info: Loading facts
Notice: Compiled catalog for centos7.home in environment production in 0.16 seconds
Info: Applying configuration version '1550788723'
Notice: /Stage[main]/Main/Yumrepo[repo-1]/ensure: created
Info: Yumrepo[repo-1](provider=yum_target): changing mode of /etc/yum.repos.d/enterprise.repo from 600 to 644
Notice: /Stage[main]/Main/Yumrepo[repo-2]/ensure: created
Notice: Applied catalog in 0.12 seconds
```
```ini
/etc/yum.repos.d/enterprise.repo:
[repo-1]
name=first repo
baseurl=http://server1.enterprise.fr/repo-1
        http://server2.enterprise.fr/repo-1
enabled=0
[repo-2]
name=second repo
baseurl=http://server1.enterprise.fr/repo-2
        http://server2.enterprise.fr/repo-2
enabled=0
```
