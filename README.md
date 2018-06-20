# InfluxDB relay

<https://github.com/influxdata/influxdb-relay>

Based on <https://github.com/appcelerator/docker-influxdb-relay>

Relay allows for a somewhat highly avaliable influxdb setup by duplicating writes to one or more standalone influxdb instances. Relay sits in front of each influxdb instance, recieves a request and writes to one of the influxdb instances, returning a successful write acnowledgement. The write is then replicated on the other instances managed by Relay. Read requests are directed to the influxdb instances using a load balancer. This work allows the Relay element of the stack to be run from within a Docker container. A load balancer implementation, based on haproxy and used to test this project can also be found at <https://github.com/ahibbitt/influxdb-proxy>
## Run the container

    docker -e HTTP_BACKEND_influxdb_a=influxdb-a:8086 -e HTTP_BACKEND_influxdb_b=influxdb-b:8086 \
           run ahibbitt/influxdb-relay

## Configuration

Variable | Description | Default value | Sample value 
-------- | ----------- | ------------- | ------------
HTTP_BIND_ADDR | bind address for the HTTP listener | :9096 |
UDP_BIND_ADDR | bind address for the UDP listener | :9096 |
HTTP_BACKEND_xx | host:port of an influxDB backend, http protocol | | influxdb-backend:8086 
UDP_BACKEND_xx | host:port of an influxDB backend, udp protocol | | influxdb-backend:8086 
UDP_MTU | UDP MTU | 512 | 1024
