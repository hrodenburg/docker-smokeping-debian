# docker-smokeping-debian
smokeping master/slave docker container based on debian

The reason to use Debian instead of Alpine is because of the availability of echoping in Debian. 

## Slave mode
The same image could be use for an master instance as well as an slave instance. To set as a slave instance, provide the following environment variables:
```
MASTER_URL=http://master
SLAVE_SECRET=testing123
MODE=SLAVE
```
