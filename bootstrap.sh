cd puppet/modules

if [[ -d apt ]]; then
  cd apt && git pull && cd ..
else
  git clone https://github.com/puppetlabs/puppetlabs-apt.git
fi

if [[ -d couchpotato ]]; then
  cd couchpotato && git pull && cd ..
else
  git clone https://github.com/morphizer/puppet-couchpotato.git
fi

if [[ -d ssh ]]; then
  cd ssh && git pull && cd ..
else
  git clone https://github.com/saz/puppet-ssh.git
fi

if [[ -d stdlib ]]; then
  cd stdlib && git pull && cd ..
else
  git clone https://github.com/puppetlabs/puppetlabs-stdlib.git
fi

if [[ -d transmission ]]; then
  cd transmission && git pull && cd ..
else
  git clone git@github.com:Akendo/puppet-transmission.git
fi

if [[ -d transmission ]]; then
  cd transmission && git pull && cd ..
else
  git clone https://github.com/puppetlabs/puppetlabs-vcsrepo.git
fi