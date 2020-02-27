# A guide to setting up remote SSH (2018-04-09)

In the right (or wrong) hands ssh is a powerful tool
for the remote management of a Unix system.
Most desktop, or workstation distributions of Linux disable
remote access over ssh by default.
The simplest method to check if you have ssh server running on your machine
is to run

```shell
ssh localhost
```

If ssh is not installed or running
this will print out a message

```error
ssh: connect to host localhost port 22: Connection refused
```

most likely indicating that the ssh server is not running.

Before heading any further in enabling remote access over ssh,
it is a good idea to ensure that you have a strong password
for all of the accounts on the device,
in particular the root account (even better is disabling it).
By enabling remote access for yourself
you are also enabling remote access for anyone else that might want to try and log in.

## Installation

The package required for installation is in most distributions named `openssh-server`.
So for Ubuntu running the command;

```shell
sudo apt install openssh-server
```

will install the package as appropriate.
Other Linux distributions have different package managers so
use the one for your distribution.
So for fedora, replace `apt` with `dnf` and for CentOS replace `apt` with `yum`.
On macOS everything is already installed and just needs to be enabled
in System Preferences > Sharing then ensure Remote Login is checked.

Once the package is installed,
it needs to be both added to the list of packages to run at boot,
and started now to test.

To start the openssh server, run the below command

```shell
sudo systemctl start ssh
```

which is using the `systemd` init system to start the openssh server instance.
For fedora and CentOS, the ssh service instead has the name sshd so run

```shell
sudo systemctl start sshd
```

to start the server instance.
Since this is probably a service you want running automatically on boot,
running the command

```shell
sudo systemctl enable ssh
```

will put files in the appropriate places to enable the service on boot.
Other useful commands for `systemctl` are `stop`, `restart`, and `disable`

Once the ssh server is running
our command to connect at localhost

```shell
ssh localhost
```

should present a new message like the one below.

```txt
The authenticity of host 'localhost (::1)' can't be established.
ECDSA key fingerprint is ba:ba:b1:4c:5a:e2:aa:40:aa:7f:aa:01:aa:df:aa:47.
Are you sure you want to continue connecting (yes/no)?
```

In some ways this is like the terms and conditions when you sign up for a website
in that you should care about and understand it,
however, typically you click through (or type yes) without reading.
Since we are connecting to localhost,
which has an IPV6 address of `::1`
or IPV4 address of `127.0.0.1`
we can trust the key fingerprint.
This is a method of checking that whenever we log into a host over ssh,
the host hasn't changed which if unexpected
could be indicative of a man-in-the-middle attack or other nefarious actions.

Now we are able to connect to the machine locally,
we need to work out how to connect from a remote machine.

## How do I Find My Device?

With the previous commands we have been passing `localhost` to the ssh command,
in the same way we might type `google.com` into a web browser.
These names are a human readable format for addressing devices,
which map to IPV6 or IPV4 addresses computers read to initiate a connection.

To find the name of the computer we are working on,
also known as the hostname,
we can use the `hostname` command.

```shell
$ hostname -f
lovelace.staff.sydney.edu.au
```

Here the `-f` gives the full hostname of the device you are using,
with a `-s` flag also supported,
however we need to full hostname.

With the full hostname,
we know the name of our device,
and we know that our device is aware of it's hostname.
This doesn't necessarily mean that any other devices know what ours is called.
The process of taking a hostname and turning it into an address
the computer can use is known as DNS,
which is provided by name servers.
Typically in organisations there are multiple levels of name servers,
which will handle both internal names,
like the hostname of our device,
and external names
like `github.com` or `wikipedia.org`.
Where a device is querying an external name server,
it will not be able to resolve local names.
To test this we can use the name server lookup `nslookup` command.

```txt
$ nslookup lovelace.staff.sydney.edu.au
Server:         172.18.240.210
Address:        172.18.240.210#53

Name:   lovelace.staff.sydney.edu.au
Address: 10.65.205.200
```

This tells us that the server at the ip address `172.18.240.210`
which my laptop is using as the default name server,
knows that `lovelace.staff.sydney.edu.au` exists at the address `10.65.205.200`.
If we instead used one of the large public DNS servers
provided by Google (`8.8.8.8`) or CloudFlare (`1.1.1.1`)
we will instead get an error message.

``` txt
$ nslookup lovelace.staff.sydney.edu.au 1.1.1.1
Server:         1.1.1.1
Address:        1.1.1.1#53

** server can't find lovelace.staff.sydney.edu.au: SERVFAIL
```

## Setting the hostname

When going through the initial setup of macOS or linux machines,
there is a step where you give the machine the hostname.
To later change the hostname requires the editing a couple of files.
The file `/etc/hostname` stores the hostname of the machine,
which will typically be the [Fully Qualified Domain Name][fqdn wiki] (FQDN) of the host.
To actually change the hostname a reboot is required,
as this file is read during the boot sequence.
Before you do reboot,
there is another file `/etc/hosts` that requires editing.

The `/etc/hosts` file is the fist place that is checked
when looking to resolve a domain name
and is sometimes used as a way to block websites
or just to resolve hostname.
We want to our domain name to resolve to `127.0.0.1` and `::1`
so that services like web servers don't get confused.
Ensure the following lines (with the appropriate hostname) are in the `/etc/hosts` file

```txt
127.0.0.1   lovelace lovelace.malramsay.com
::1         lovelace lovelace.malramsay.com
```

This sets the ip address we want the hostname to resolve to,
which on the first line is `127.0.0.1`,
followed by a list of hostnames,
being the short version `lovelace` and the FQDN `lovelace.malramsay.com`.

## What do I do if I can't lookup my hostname?

The reason we use domain names and hostnames
is that they are far easier to remember than a string of numbers.
It is possible to navigate to Google by navigating to the ip address [216.58.200.110](http://216.58.200.110)
which is the address returned for google.com.

``` txt
$ nslookup google.com
Server:         172.18.240.210
Address:        172.18.240.210#53

Non-authoritative answer:
Name:   google.com
Address: 216.58.200.110
```

While using the IP address is possible,
it is far more cumbersome to remember and to type.
For a single IP address which we can put in a configuration file,
this isn't too problematic.

To find the ip address of the current host
run the command `ip addr`,
which will give output like that below.

``` txt
$ ip addr
lo0: flags=8049<UP,LOOPBACK,RUNNING,MULTICAST> mtu 16384
        inet 127.0.0.1/8 lo0
        inet6 ::1/128
        inet6 fe80::1/64 scopeid 0x1
en0: flags=8863<UP,BROADCAST,SMART,RUNNING,SIMPLEX,MULTICAST> mtu 1500
        ether 78:4f:43:4d:cc:53
        inet6 fe80::18c5:93d4:e972:b798/64 secured scopeid 0x7
 >      inet 10.16.249.156/21 brd 10.16.255.255 en0
awdl0: flags=8943<UP,BROADCAST,RUNNING,PROMISC,SIMPLEX,MULTICAST> mtu 1484
        ether b6:54:4e:bd:a7:d7
        inet6 fe80::b454:4eff:febd:a7d7/64 scopeid 0xa
utun0: flags=8051<UP,POINTOPOINT,RUNNING,MULTICAST> mtu 2000
        inet6 fe80::1c95:35f4:acea:1034/64 scopeid 0x10
en5: flags=8863<UP,BROADCAST,SMART,RUNNING,SIMPLEX,MULTICAST> mtu 1500
        ether ac:df:48:00:11:22
        inet6 fe80::aede:48ff:fe00:1122/64 scopeid 0x9
en7: flags=8863<UP,BROADCAST,SMART,RUNNING,SIMPLEX,MULTICAST> mtu 1500
        ether 00:0e:c6:e2:bb:69
        inet6 fe80::1871:5dc7:1f58:2127/64 secured scopeid 0x12
 >      inet 10.65.205.200/24 brd 10.65.205.255 en7
```

The lines we are looking for are those with `inet` at the start
which I have denoted with a `>`.

This gives me two IP addresses,
one for the wifi and another for the wired ethernet connection.
You may have noticed that the `10.65.205.200` address matched that obtained
from the `nslookup` of my hostname above.
This tells me that the name server is directing
queries of my hostname back to my device.

Now we have an ip address,
how do we make the computer remember it
when the name server doesn't.

## Remembering IP addresses

The DNS lookup of IP addresses from hostnames works on
the institutional network I have access to at the University of Sydney.
You will likely not have this same configuration,
so there are some alternate methods
for getting your computer to remember ip addresses.

### SSH configuration file

The simplest method of getting the computer
to remember an ip address for you is the ssh config file `~/.ssh/config`.
This approach only works when connecting using ssh,
however, it is useful for setting all the parameters for an ssh connection.
By putting the code snippet below in `~/.ssh/config`

```sshconfig
Host lovelace
    Hostname 10.65.205.200
    User malcolm
```

running the command `ssh lovelace`,
is equivalent to running `ssh malcolm@10.65.205.200`
and is much easier to both type and remember (and tab-complete).
Additional useful parameters for the configuration are

- `LocalForward`/`RemoteForward` for port forwarding,
- `Port` when using a non-standard port, and
- `IdentityFile` for using specific private keys.

The `ssh_config` man pages (`man ssh_config`) also contain
all the parameters available and information about each of them.

### Hosts file

Earlier we modified the `/etc/hosts` file to change the hostname of our system.
We can also use it to remember the ip address of other systems.
This is not recommended for managing many devices, use DNS for that,
for a small number of systems we can use use this file for the translation of
domain names to ip addresses.
Instead of using the ip address of localhost,
we use the ip address we want the hostname to resolve to as shown below.

```txt
10.65.205.200   lovelace.malramsay.com
```

The advantage this approach has over the ssh configuration
is that it will also resolve the hostname in the web browser.
This also makes it much easier to access web services
like jupyter notebooks on the remote host.

## Conclusion

This should be sufficient to get started using SSH within the same network.
To access the service over the internet,
where possible use the institutional VPN,
or set up your own.

[fqdn wiki]: https://en.wikipedia.org/wiki/Fully_qualified_domain_name

<!-- markdownlint-disable-file -->
