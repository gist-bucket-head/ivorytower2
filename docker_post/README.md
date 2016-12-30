Docker Image for Neo4J
===

- Nov 2016

Terminology
---

- docker: a containerized systems manager
- image: like a CD or an ISO
- container: like a VM 

Usage
---

- This will reset the conditions of docker .. careful, this will blow away all local images and containers `./reset.sh`
- `./run_docker.sh`
- # `sudo su - cjm`
- `./setup_as_user.sh`
- `sudo ./setup_with_sudo.sh`
- `./run.sh`
- Visit 69.164.218.97:7474/browser (from anywhere)
- Login as neo4j/neo4j
- Change the password
- `killall java`
- `./run.sh`
- `match (n) return n;` - no rows
- Visit 69.164.218.97:8080/neo4j.html (from anywhere)
- `create (n:MapItem {name: "Boston", lat: "0.000", long: "0.000"})`


TODO
----

- Fix this: `WARNING: Max 1024 open files allowed, minimum of 40000 recommended. See the Neo4j manual.`
- Make MY_IP in Dockerfile be configurable and remove 69.164.218.97 from documentation
- open CORS for the  http-server on 8080

