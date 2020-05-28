FROM centos:7
LABEL maintainer="mahyar.sepehr" \
      description="Base container image for Metasploit based on Red Hat Enterprise Linux"

USER root

RUN yum -y update 

RUN curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall && \
    chmod 755 msfinstall && \
    ./msfinstall 


#    RUN curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall && \
#    chmod 755 msfinstall && \
#    ./msfinstall && \
#    yum install --enablerepo=rhel-server-rhscl-7-rpms -y net-tools

COPY entrypoint.sh /usr/bin/entrypoint.sh
RUN chmod 755 /usr/bin/entrypoint.sh && \
    chown root:root /etc/passwd && \
    chown root:root /etc/group && \
    chmod 664 /etc/passwd && \
    chmod 664 /etc/group

ENV HOME /home/ocpuser

RUN mkdir ${HOME} && \
    chown root:root ${HOME} && \
    chmod 770 ${HOME} && \
    mkdir ${HOME}/.msf4 && \
    chmod 770 ${HOME}/.msf4
COPY msfconsole.rc ${HOME}/.msf4/msfconsole.rc

WORKDIR ${HOME}

USER 1001


ENTRYPOINT ["/usr/bin/entrypoint.sh"]
