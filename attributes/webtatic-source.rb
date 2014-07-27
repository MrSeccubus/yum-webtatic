default['yum']['webtatic-source']['repositoryid'] = 'webtatic-source'

case node['platform']
when 'amazon'
  el_version = 6
else
  el_version = node['platform_version'].to_i
end

case el_version
when 5, 6
  default['yum']['webtatic-source']['gpgkey'] = 'http://mirror.webtatic.com/yum/RPM-GPG-KEY-webtatic-andy'
when 7
  default['yum']['webtatic-source']['gpgkey'] = 'http://mirror.webtatic.com/yum/RPM-GPG-KEY-webtatic-el7'
end

default['yum']['webtatic-source']['description'] = "Webtatic Repository EL#{el_version} - $basearch - Source"
default['yum']['webtatic-source']['mirrorlist'] = "http://mirror.webtatic.com/yum/el#{el_version}/SRPMS/mirrorlist"

default['yum']['webtatic-source']['failovermethod'] = nil
default['yum']['webtatic-source']['gpgcheck'] = true
default['yum']['webtatic-source']['enabled'] = false
default['yum']['webtatic-source']['managed'] = false