# Debug container

Contains debugging tools for production. Based on alpine.

* Build/code: `build-base git bash bash-completion vim jq`
* Network: `bind-tools iputils tcpdump curl nmap tcpflow iftop net-tools mtr netcat-openbsd bridge-utils iperf ngrep`
* Certificates: `ca-certificates openssl`
* Processes/IO: `htop atop strace iotop sysstat ltrace ncdu logrotate hdparm pciutils psmisc tree pv`