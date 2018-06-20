Automated Repository Tests for Docker Cloud Build. 

Test harness will:
* Set up 2 influxdb containers, two influxdb-relay containers, one influxdb-proxy container and one sut container
* Create database on each influxdb instance, testing for successful creation.
* Write data to influxdb via the proxy, which in turn will route to a relay, which will replicate traffic, testing for successful write
* Read data from a random backend using the proxy and validate this data, testing for both the read and validation
* Read data from each influxdb backend directly, again validating the data and again testing for voth read and validation

## Run the tests locally
From the root of the repository at <https://github.com/ahibbitt/influxdb-relay>, run: 

    docker-compose -f docker-compose.test.yml up
    
## Run the tests automatically
Docker Hub will automatically run the test harness when an automated build is set up with the above repository as source.

