# PostgreSQL pgAdmin

**pgAdmin** is a web based administration tool for the PostgreSQL database. This utility runs an instance of pgAdmin as a Docker container.

# Folder content

* **run.sh**: it is the entrypoint command of this utility
* **servers.json**: an empty file on where the admin application will save your configurations


# Usage

## Requirements

If you are running this tool on a Windows Subsistem Linux (WSL) keep in mind that you can have some problems with absolute paths when you mount volumes. If this is your case have a look at the wsl parameter when you run the run.sh command.

Other requirements:
1. a bash
2. docker running on the machine and docker command executable into your shell
3. Internet connection

## Run

First of all, create an empty dir called **env**. Then simply execute the command:
```bash
# on Linux
./run.sh

# on WSL
./run.sh true
```

## Close

Just stop the container with:
```bash
docker stop pgadmin-4-11
```

# License

Apache License 2.0