# curlftpfs

Original repo located at: https://github.com/galo2099/curlftpfs

## Description
CurlFtpFS is a filesystem for acessing ftp hosts based on FUSE and
libcurl. It automatically reconnects if the server times out. 

As the FTP protocol is not very feature rich, this filesystem does not fulfill every constraint of a real filesystem, but it should be usable for simple tasks like copying and editing files.

The purpose of this fork is to fix some personal issues I'm having with [curlftpfs](https://github.com/galo2099/curlftpfs).

## Requirements

glib-2.0  
libcurl >= 7.17.0  
fuse >= 2.2

## Compilation

```shell
./build.sh
```
## Install

```shell
./install.sh
```
## Remove or uninstall

```shell
./uninstall.sh
```

## Usage

```shell
curlftpfs <ftpsite> <mountpoint>
```

ex.:
```shell
curlftpfs ftp://ftp.sunet.se/ sunet/
```


## Debugging

```shell
curlftpfs -f -v -o debug,ftpfs_debug=3 <ftpsite> <mountpoint> 
```

(runs the curlftpfs in foreground and shows libcurl verbose debug output)  


## Known Problems

1) Several GUI application (gedit, leafpad,...) use open(O_RDWR) + seek mode for saving files 
which cannot be supported by the FTP protocol. Therefore saving files might throw an error.
Hopefully future kernels will provide special errno's to make it easier to 
deal with less capable file-systems.

2) There seems to be a bug in libcurl 7.18 which sometimes causes problems reading files. 
Should be fixed in libcurl >= 7.18.2

http://sourceforge.net/tracker/index.php?func=detail&aid=1951588&group_id=976&atid=100976




