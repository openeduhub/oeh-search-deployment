# Open Edu Hub Search Deployment

Manges the deployment of an OEH-Search instance.

Related repositories:
- https://github.com/openeduhub/oeh-search-frontend
- https://github.com/openeduhub/oeh-search-elasticsearch-relay

## Run

Run `docker-compose pull` to update images.

Run `docker-compose up` to start all required containers.

### Runtime Configuration

Some variables have to be defined in a `.env` file.
Copy `.env.example` to `.env` and adapt the values to your configuration.

### HTTP Server and Routing

The frontend requires routes to the ElasticSearch relay under the same URL the frontend is served.
This can be achieved with a reverse proxy. A config for Nginx could look like this:

```nginx
server {
    # ...
    location / {
            proxy_pass http://localhost:8080;
    }
    location /relay/ { 
            proxy_pass http://localhost:3000/; 
    }
}
```

### Update Deployment

Individual components can be updated independently, e.g.,

```bash
docker-compose up -d --no-deps elasticsearch-relay frontend
```
