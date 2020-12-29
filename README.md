## Example of using Nginx to load balance multiple Gunicorn servers

Scenario: We have 4 Gunicorn servers for our Django app. We have one reverse proxy Nginx server which channels requests to our Gunicorn servers.
* Nginx on localhost:9000
* Gunicorn server on localhost:8001
* Gunicorn server on localhost:8002
* Gunicorn server on localhost:8003
* Gunicorn server on localhost:8004 with slightly different landing page to further prove the point that Nginx is load balancing

Custom access log with ```$upstream_addr``` to show Nginx is acting as a load balancer.

## Running the test to prove Nginx is load balancing Gunicorn servers

```
git clone git@github.com:hongjinn/nginx-gunicorn-load-balancer.git
docker-compose up --build -d
docker logs -f container_nginx_lb
# Open your browser and go to http://localhost:9000/
# Hit refresh a few times
# You will see that Nginx is load balancing (round robin approach) between the 4 Gunicorn servers
# You will also note that the 4th server has a slightly different landing page!
# Success!
```

Load balancing can be round robin, least-connected, or ip_hash which is specified in ```nginx/default.conf```
