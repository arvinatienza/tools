#!/bin/bash
set -e

MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD:-""}
MYSQL_DATABASE=${MYSQL_DATABASE:-""}
MYSQL_USER=${MYSQL_USER:-""}
MYSQL_PASSWORD=${MYSQL_PASSWORD:-""}
MYSQLD_ARGS=${MYSQLD_ARGS:-""}
RESTORE_FILE=${RESTORE_FILENAME:-""}

chown -R mysql:mysql /var/lib/mysql
sed -i 's/^\(bind-address\s.*\)/# \1/' /etc/mysql/my.cnf
sed -i 's/^\(log_error\s.*\)/# \1/' /etc/mysql/my.cnf
mysql_install_db --user mysql > /dev/null

tfile=`mktemp`
if [[ ! -f "$tfile" ]]; then
    return 1
fi

# Setup initial database
cat << EOF > $tfile
USE mysql;
FLUSH PRIVILEGES;
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;
UPDATE user SET password=PASSWORD("$MYSQL_PASSWORD") WHERE user='root';
EOF

if [[ $MYSQL_DATABASE != "" ]]; then
    echo "CREATE DATABASE IF NOT EXISTS \`$MYSQL_DATABASE\` \
        CHARACTER SET utf8 COLLATE utf8_general_ci;" \
    >> $tfile

    if [[ $MYSQL_USER != "" ]]; then
        echo "GRANT ALL ON \`$MYSQL_DATABASE\`.* to \
            '$MYSQL_USER'@'%' \
            IDENTIFIED BY '$MYSQL_PASSWORD';" \
        >> $tfile
    fi
fi

/usr/sbin/mysqld --bootstrap --verbose=0 $MYSQLD_ARGS < $tfile
rm -f $tfile


if [[ $RESTORE_FILE != "" && -e $RESTORE_FILE ]]; then
    mysql -uroot -p$mysql_password < $RESTORE_FILE
fi

exec /usr/sbin/mysqld $MYSQLD_ARGS
