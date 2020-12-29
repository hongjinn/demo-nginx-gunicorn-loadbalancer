## Example of using Nginx to load balance for Gunicorn servers

Scenario: We have 3 Gunicorn servers for our Django app. We have one reverse proxy Nginx server which channels requests to our Gunicorn servers.
* Nginx on localhost:9000
* Gunicorn server on localhost:8001
* Gunicorn server on localhost:8002
* Gunicorn server on localhost:8003
