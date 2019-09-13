# Telnet

**pgAdmin** is a web based administration tool for the PostgreSQL database. This utility runs an instance of pgAdmin as a Docker container.

# Folder content

* **telnet.sh**: it is the entrypoint command of this utility

# Usage

## Requirements

Other requirements:
1. a bash
2. docker running on the machine and docker command executable into your shell
3. Internet connection

## Run

Execute the command:
```bash
./telnet.sh <host> <port> [OPTIONS]
```

## Close

You have nothing to close. This container will autodestroy when it stops.

# License

Apache License 2.0