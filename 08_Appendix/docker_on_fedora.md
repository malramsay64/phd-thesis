# A Complete Guide to Docker on Fedora (2018-09-02)

While there are numerous guides to installing Docker on Fedora,
none of the guides leave the installation
in a state that I would consider usable.
This is intended to be a single complete guide
for the setup and configuration of Docker,
highlighting the differences that are required
to get Docker running on Fedora.
I will be demonstrating using Fedora 28,
however, this should be the same for previous or future releases.

## Installation

This is the part that all the guides include,
including the [fedora documentation][docker fedora developer].
Docker is in the Fedora repositories
enabling installation using the `dnf` package manager

```shell
sudo dnf install docker
```

Once installed, the Docker service can be started by running

```shell
sudo systemctl start docker
```

and should you want to start docker
every time you boot your machine
you can run

```shell
sudo systemctl enable docker
```

Note that the above command doesn't start the Docker service immediately,
so you will have to run both the `start` and `enable` commands
to have the Docker service running now and on following reboots.

At this point you might want to try running a Docker container

```shell
$ docker run hello-world
/usr/bin/docker-current: Got permission denied while trying to connect
to the Docker daemon socket at unix:///var/run/docker.sock ...
```

only you get a permission denied error.
It is possible to run Docker as `root`,
however it is probably not the best idea
since it is kind of simple to make a mistake.

If instead you received the message

```shell
$ docker run hello-world
/usr/bin/docker-current: Cannot connect to the Docker daemon at
unix:///var/run/docker.sock. Is the docker daemon running?
```

this means you haven't started Docker and need to run

```shell
sudo systemctl start docker
```

## Setting Permissions

{{% alert note %}}
This section has the potential to break things which are difficult to fix.
Please be really careful, unlike me.
{{% /alert %}}

This follows the optional [post installation][docker post-install] steps in the Docker documentation.

For users to have permission to access the Docker socket,
they either need to be root,
or they can be a member of the `docker` group.



This group probably doesn't exist on your system yet,
though you can check by running

```shell
grep docker /etc/group
```

If there is no output the group does not yet exist
and can be created with the `groupadd` command

```shell
sudo groupadd docker
```

The group should now appear in the `/etc/group` file

```shell
$ grep docker /etc/group
docker:x:1001:
```

The final step is adding yourself and/or any other users to the Docker group.
This is done with the command

{{% alert warning %}}
Running the below command without append
will remove you from the `wheel` group
meaning you will no longer be able to run commands with `sudo`.
If you are the only user with root access
you will have to repair your install from a live image.
{{% /alert %}}

```shell
sudo usermod --append --groups docker $USER
```

You have to go through the login process to update your group membership,
with the safest method being to open an `ssh` connection to `localhost`.
This means that if you accidentally remove yourself from the `wheel` group,[^1]
you just have to disconnect the session
to regain sudo permissions and fix things.

To check everything is as expected,
the `groups` command will list the groups you are a part of.

```shell
$ groups
malcolm wheel docker
```

You should have a list of groups similar to those output above.
Now you are a member of the `docker` group
you can test Docker is working with the test image

```shell
$ docker run hello-world

Hello from Docker!
This message shows that your installation appears to be working correctly.

...
```

This indicates that Docker is working properly.

## Mounting Local Directories

Now you have Docker working,
you probably want to do something useful with it
like access the local filesystem for processing.

```shell
$ docker run --interactive --tty --volume $(pwd):/srv ubuntu
root@aa7c5f9dcef9:/# _
```

The above command creates an interactive terminal (tty)
running in an Ubuntu container,
with the prompt for the container now showing.
Additionally we have mounted the current directory to the container
at the `/srv` folder of the container.
We can try and access the contents of the current directory
from within the container

```shell
root@aa7c5f9dcef9:/# ls
ls: can't open '/srv': Permission denied
```

On an Ubuntu install this would work,
however Fedora uses SELinux for security,
which requires the appropriate labelling of file objects
for the processes using them.
By default Docker doesn't perform this labelling,
however we can tell it to with the `:z` or `:Z` suffixes for the volume.
The lowercase `:z` allows multiple containers to access the volume
and the uppercase `:Z` allows a single container to access the volume.
The command becomes

```shell
$ docker run -it -v $(pwd):/srv:Z ubuntu
root@aa7c5f9dcef9:/# ls /srv
docker_on_fedora.md
```

Here I have used the more common shortened command line options,
`-it` for the interactive terminal, and `-v` for the volume.


For a program that at first glance appears to simple to install,
Docker is rather difficult to get set up properly on Fedora.
Hopefully this

[^1]: I have done this...twice

[docker post-install]: https://docs.docker.com/install/linux/linux-postinstall/
[docker fedora developer]: https://developer.fedoraproject.org/tools/docker/docker-installation.html

<!-- markdownlint-disable-file -->
