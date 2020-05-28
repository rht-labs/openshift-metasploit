#!/bin/bash

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

USER_ID=$(id -u)
GROUP_ID=$(id -g)

echo "ocpuser:x:${USER_ID}:${GROUP_ID}:OCP User:/home/ocpuser:/bin/bash" >> /etc/passwd

tee "/home/ocpuser/.msf4/database.yml" > /dev/null << EOF
production:
    adapter: postgresql
    database: ${METASPLOIT_DB_NAME}
    username: ${METASPLOIT_DB_USER}
    password: ${METASPLOIT_DB_PASS}
    host: ${METASPLOIT_DB_HOST}
    port: ${METASPLOIT_DB_PORT}
    pool: 75
    timeout: 5
EOF

## Run msfd in foreground
msfd -f