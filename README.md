# Chivo

A prototype copy of `sudo` to learn how it works

## How to run it

Install [Crystal](https://crystal-lang.org) on a Ubuntu 16.04.3 Linux (other distros may work, depending on how they handle auth). Then clone the project and run:

```
crystal build ./chivo.cr # compile
sudo chown root:root ./chivo # make root be the owner
sudo chmod a+xs ./chivo # set execution and suid bit
```

Now you can run (some of) your programs as root:

```
$ whoami
utnso
$ ./chivo whoami
root
```
