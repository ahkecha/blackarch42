<h1 align="center">Welcome to BlackArch42 👋</h1>
<p>
  <img alt="Version" src="https://img.shields.io/badge/version-0.1-blue.svg?cacheSeconds=2592000" />
  <a href="https://github.com/git/git-scm.com/blob/main/MIT-LICENSE.txt" target="_blank">
    <img alt="License: MIT" src="https://img.shields.io/badge/License-MIT-yellow.svg" />
  </a>
</p>

> Fully customizable BlackArch unofficial image with basic tools ready to use on 42/1337 macs using goinfree storage


## About the image

Blackarch image with many pre-installed tools

* crackmapexec
* metasploit
* nmap
* wfuzz / ffuf
* Impacket
* hashcat
* pwncat
* nuclei
* nicto
* SQLMap
* exploitdb (searchsploit)
* binwalk
* radare2
* gdb
and more...

## Getting Started


First, git clone this repository or simply download and untar/extract it and
edit the Makefile variables for your suitable hardware needs.

#### Initialize goinfree env (run this on the first launch ONLY!)
```sh
make init
```
#### Build docker image
```sh
make build
```
#### Run your container
```sh
make run
```

👤 **ahkecha**

* Github: [@akecha](https://github.com/akecha)

