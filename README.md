sudo xinit /usr/bin/xbmc --standalone -- -nocursor :0
http://wiki.xbmc.org/index.php?title=HOW-TO:Install_XBMC_for_Linux



%w{
  git-core
  python-software-properties
  pkg-config
  software-properties-common
  xinit
  xbmc
  xbmc-standalone
}.each do |pkg|
  package pkg do
    action :install
  end
end


user "xbmc" do
  supports :manage_home => true
  comment "Media center user"
  gid "users"
  home "/home/xbmc"
  shell "/bin/bash"
end