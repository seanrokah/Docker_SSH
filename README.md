# SSH Server Docker Setup

This project provides a simple way to run an Ubuntu-based SSH server inside a Docker container. You can customize the root password and the SSH port exposed on your host machine.

---

## Prerequisites

- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)


---

## Configuration

You can customize the following parameters:

- `ROOT_PASSWORD`: Password for root SSH access (default: `changeme`)
- `SSH_PORT`: Port on your host to map to the container's SSH port 22 (default: `2222`)

These can be set as arguments to the setup script.

---

## Usage

1. **Clone this repository:**
   ```sh
   git clone https://github.com/seanrokah/Docker_SSH
   cd Docker_SSH
   ```

2. **Run the setup script:**
   ```sh
   ./setup.sh <root_password> <host_port>
   ```
   - `<root_password>`: (Optional) The password for the root user inside the container. Default is `changeme`.
   - `<host_port>`: (Optional) The port on your computer to map to the container's SSH port 22. Default is `2222`.

   **Example:**
   ```sh
   ./setup.sh mysecretpassword 2200
   ```

   This will build the Docker image, start the container, and attempt to connect via SSH.

3. **Connect via SSH:**
   ```sh
   ssh -p <host_port> root@localhost
   ```
   - Use the password you set (or the default).

---

## How It Works

- The `dockerfile` builds an Ubuntu image with OpenSSH server installed.
- The root password is set at build time using a build argument.
- The SSH port is mapped from the container to your host using Docker Compose.
- The `setup.sh` script automates the build, run, and connection process.

---

## Troubleshooting

- **Password changes not taking effect?**
  - The image must be rebuilt for password changes. The setup script handles this with `docker compose build --no-cache`.
- **SSH connection hangs or fails?**
  - The SSH server may take a few seconds to start. If you connect too soon, retry after a few seconds.
- **Port already in use?**
  - Choose a different `<host_port>` when running the setup script.
- **Permission denied (publickey)?**
  - Make sure you are using password authentication and the correct port.

---

## Project Files

- `dockerfile`: Defines the container image and SSH setup.
- `docker-compose.yml`: Manages the container and port mapping.
- `setup.sh`: Automates build, run, and SSH connection.
- `TASKS.md`: Project TODOs and tasks.
- `CONTRIBUTORS.md`: List of contributors.

---

## Contributors

See [CONTRIBUTORS.md](CONTRIBUTORS.md) for a list of contributors.

---

