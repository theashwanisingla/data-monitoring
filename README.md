# data-monitoring
For event monitoring and alerting
#

This contains source code for creating the docker container for Node Exporter and Prometheus Data source. 

User can build and run the container to start collecting the data from the nodes and to save into the database. 

To visualise the data, user can hit the following command:

```
docker run -p 9090:9090 <container-ID>
```

Now user can visit the following link to open the prometheus interface to select the node and visualise it:
```
http://www.localhost:9090
```

