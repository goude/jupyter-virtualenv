#!/bin/bash
source venv/bin/activate
PIP_CMD="pip3 --no-cache-dir"

sudo alien -i install/oracle-instantclient12.1-basiclite-12.1.0.2.0-1.x86_64.rpm
sudo alien -i install/oracle-instantclient12.1-devel-12.1.0.2.0-1.x86_64.rpm

export LD_LIBRARY_PATH=/usr/lib/oracle/11.2/client/lib
export ORACLE_HOME=/usr/lib/oracle/11.2/client
export TNS_ADMIN=/usr/lib/oracle/11.2/client/network/admin

$PIP_CMD install cx_oracle
