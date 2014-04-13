# Todo
* Find way to backup xbmc settings


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


Go to puppet folder
>puppet apply --modulepath modules manifests/default.pp


I use a mac mini
Install refit to dual boot it with Ubuntu then change boot priority to Ubuntu:

Boot with OSX and open /efi/refit/refit.conf
Last line change #default_selection L to
default_selection L


# Log problem
xorg-server 2:1.11.4-0ubuntu10.14 (For technical support please see http://www.ubuntu.com/support)
Current version of pixman: 0.30.2
  Before reporting problems, check http://wiki.x.org
  to make sure that you have the latest version.
Markers: (--) probed, (**) from config file, (==) default setting,
  (++) from command line, (!!) notice, (II) informational,
  (WW) warning, (EE) error, (NI) not implemented, (??) unknown.
(==) Log file: "/var/log/Xorg.0.log", Time: Mon Apr  7 20:57:12 2014
(==) Using config file: "/etc/X11/xorg.conf"
(==) Using system config directory "/usr/share/X11/xorg.conf.d"

Fatal server error:
no screens found

Please consult the The X.Org Foundation support
   at http://wiki.x.org
 for help.
Please also check the log file at "/var/log/Xorg.0.log" for additional information.

 ddxSigGiveUp: Closing log
Server terminated with error (1). Closing log file.




[   223.120] (==) Assigned the driver to the xf86ConfigLayout
[   223.120] (II) LoadModule: "intel"
[   223.121] (WW) Warning, couldn't open module intel
[   223.121] (II) UnloadModule: "intel"
[   223.121] (II) Unloading intel
[   223.121] (EE) Failed to load module "intel" (module does not exist, 0)
[   223.121] (II) LoadModule: "vesa"
[   223.121] (WW) Warning, couldn't open module vesa
[   223.121] (II) UnloadModule: "vesa"
[   223.121] (II) Unloading vesa
[   223.121] (EE) Failed to load module "vesa" (module does not exist, 0)
[   223.121] (II) LoadModule: "fbdev"
[   223.121] (WW) Warning, couldn't open module fbdev
[   223.121] (II) UnloadModule: "fbdev"
[   223.121] (II) Unloading fbdev
[   223.121] (EE) Failed to load module "fbdev" (module does not exist, 0)
[   223.121] (EE) No drivers available.
[   223.121]
Fatal server error:
[   223.121] no screens found
[   223.121]

# Configure static ip

Open /etc/network/interfaces  with vim

*********************************
# This file describes the network interfaces available on your system
# and how to activate them. For more information, see interfaces(5).

# The loopback network interface
auto lo
iface lo inet loopback

# The primary network interface
auto eth0
iface eth0 inet static
address 192.168.1.104
netmask 255.255.255.0
network 192.168.1.0
broadcast 192.168.1.255
gateway 192.168.1.1
dns-nameservers 8.8.8.8 8.8.4.4
# This is an autoconfigured IPv6 interface
iface eth0 inet6 auto
*********************************

Restart network interface
sudo /etc/init.d/networking restart