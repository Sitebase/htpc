cd puppet/modules

if [[ -d apt ]]; then
  cd apt && git pull && cd ..
else
  git clone https://github.com/puppetlabs/puppetlabs-apt.git apt
fi

if [[ -d couchpotato ]]; then
  cd couchpotato && git pull && cd ..
else
  git clone https://github.com/morphizer/puppet-couchpotato.git couchpotato
fi

if [[ -d ssh ]]; then
  cd ssh && git pull && cd ..
else
  git clone https://github.com/saz/puppet-ssh.git ssh
fi

if [[ -d stdlib ]]; then
  cd stdlib && git pull && cd ..
else
  git clone https://github.com/puppetlabs/puppetlabs-stdlib.git stdlib
fi

if [[ -d transmission ]]; then
  cd transmission && git pull && cd ..
else
  git clone https://github.com/olbat/puppet-transmission_daemon.git transmission_daemon
  #git clone https://github.com/Akendo/puppet-transmission.git transmission
fi

if [[ -d vcsrepo ]]; then
  cd vcsrepo && git pull && cd ..
else
  git clone https://github.com/puppetlabs/puppetlabs-vcsrepo.git vcsrepo
fi