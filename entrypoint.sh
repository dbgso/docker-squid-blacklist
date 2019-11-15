# launch squid
squid

# reload configs when blacklist is modified
inotifywait -m /etc/squid/blacklist* -e MODIFY  | xargs -i sh -c "squid -k reconfigure && echo restart" &

# add permissino to squid user
chmod -R 755 /var/log/squid
chown -R squid:squid /var/log/squid
chmod -R 755 /var/cache/squid
chown -R squid:squid /var/cache/squid

# wait if logs have not created
if [ ! -e /var/log/squid/access.log ];then
    echo wait logs
    inotifywait -e CREATE /var/log/squid/
fi

tail -f /var/log/squid/*.log
