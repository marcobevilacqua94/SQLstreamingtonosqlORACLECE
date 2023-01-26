#!/usr/bin/env bash
# Wait for database to startup
export ORACLE_SID=XE
for i in {1..50};
do
    sqlplus SYS/oracle as sysdba @DBSampleObjects
    if [ $? -eq 0 ]
    then
        echo "DBSampleObjects.sql completed"
        break
    else
        echo "not ready yet..."
        sleep 1
    fi
done
for j in {1..50};
do
    sqlplus SYS/oracle as sysdba @loaddata.sql
    if [ $? -eq 0 ]
    then
        echo "loaddata.sql completed"
        break
    else
        echo "not ready yet..."
        sleep 1
    fi
done
