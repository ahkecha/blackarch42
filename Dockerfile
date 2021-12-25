# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ahkecha <ahkecha@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/12/25 16:08:46 by ahkecha           #+#    #+#              #
#    Updated: 2021/12/25 17:05:09 by ahkecha          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM blackarchlinux/blackarch:latest

ENV EDITOR=vim
ENV TERM=xterm-256color


RUN patched_glibc=glibc-linux4-2.33-4-x86_64.pkg.tar.zst && \
   	curl -LO "https://repo.archlinuxcn.org/x86_64/$patched_glibc" && \
   	bsdtar -C / -xvf "$patched_glibc" && \
	pacman -Syu --noconfirm make && \
    # Install packages
    pacman -Syu --noconfirm openssh vim tmux screen supervisor iw man mlocate pciutils less bash-completion git wget base-devel python3 python2 nmap binwalk gdb hashcat john metasploit wfuzz ffuf smbclient crackmapexec impacket seclists enum4linux

# Copy BlackArch configs
RUN cp -r /etc/skel/. /root/. && \
    echo 'root:blackarch' | chpasswd && \
    echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config

RUN echo "Include /etc/ssh/sshd_config.d/*.conf" > /etc/ssh/sshd_config
RUN echo "ListenAddress 0.0.0.0" >> /etc/ssh/sshd_config
RUN echo "PermitRootLogin yes " >> /etc/ssh/sshd_config
RUN echo "#PasswordAuthentication yes " >> /etc/ssh/sshd_config
RUN echo "PermitEmptyPasswords no " >> /etc/ssh/sshd_config
RUN echo "ChallengeResponseAuthentication no " >> /etc/ssh/sshd_config
RUN echo "UsePAM yes " >> /etc/ssh/sshd_config
RUN echo "X11Forwarding yes "  >> /etc/ssh/sshd_config
RUN echo "PermitTTY yes " >> /etc/ssh/sshd_config
RUN echo "PrintMotd no" >> /etc/ssh/sshd_config
RUN echo "AcceptEnv LANG LC_*" >> /etc/ssh/sshd_config
RUN echo "Subsystem	sftp	/usr/lib/openssh/sftp-server" >> /etc/ssh/sshd_config

# OPEN SSH PORTS
EXPOSE 22/tcp


WORKDIR /root
RUN pacman -S --noconfirm zsh blackarch-config-zsh
RUN cp /usr/share/blackarch/config/zsh/zshrc ~/.zshrc
CMD ["zsh"]
