# Copyright 2019 Red Hat, Inc.
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

FROM registry.access.redhat.com/rhel7
LABEL maintainer="deven.phillips@redhat.com" \
      description="Base container image for Metasploit based on Red Hat Enterprise Linux"

USER root

RUN curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall && \
    chmod 755 msfinstall && \
    ./msfinstall

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