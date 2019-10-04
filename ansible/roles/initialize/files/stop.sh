#!/usr/bin/env bash

pm2 stop all && pm2 delete all && rm -rf /root/.pm2/logs/* && service mongod stop && rm -rf /var/log/mongodb/mongod.log && service instrumentald stop && rm -rf /var/log/access_log.* /var/log/spring.* /var/log/syslog.* /var/log/auth.log.* /var/log/fail2ban.log /var/log/kern.log.* /var/log/*.1
