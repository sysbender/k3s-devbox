# k3s-devbox
A development environment setup for Kubernetes, designed for local use with K3s – a lightweight, easy-to-deploy version of Kubernetes. 


With k3s-devbox, you get a fully configured development environment using K3s as the local Kubernetes cluster, combined with essential developer tools such as kubectl, helm, Terraform, FRP (Fast Reverse Proxy), and more.

## Features
- K3s: A lightweight Kubernetes distribution for local development.
- Kubernetes Tools: Tools like kubectl, helm, kustomize, kubectx, and k9s for efficient cluster management.
- DevOps Utilities: Includes Terraform, Helm, and other tools for automating cloud-native deployments.
- FRP (Fast Reverse Proxy): Securely expose local services to the internet via FRP, useful for testing HTTP services.
- Customizable: Easily extend this environment by adding more tools or configurations.

## Setup and Usage
### Prerequisites
Devbox: Install Devbox to run this development environment easily.
### Installation
1. Clone the repository to your local machine:

```bash

git clone https://github.com/your-username/k3s-devbox.git
cd k3s-devbox
```
1. Make sure Docker is running on your machine.

1. Install Devbox by following the instructions in the official Devbox repository.

1.To start the environment, run:

```bash

devbox shell
```
This will initialize the environment, download the necessary tools, and set up your local Kubernetes cluster using K3s.

### Running K3s Cluster
Once inside the Devbox shell, you can easily start the K3s single-node Kubernetes cluster by running:

```bash

devbox run start-k3s
```
This command will install and configure a K3s cluster on your local machine. It will also print the K3s version after the setup.

### Expose Local Services via FRP
You can use FRP (Fast Reverse Proxy) to expose your local services to the internet (for testing or demo purposes).

Set your FRP server address and token in the .env file:

```env
 
FRP_SERVER_ADDR=your.frp.server.address
FRP_AUTH_TOKEN=your-frp-authentication-token
```
To start the FRP client and expose your local port 8080 to the internet, run:

```bash
 
devbox run start-frp
```
This will configure and start the FRP client to forward your local 8080 HTTP service to the remote FRP server.

### Tools Included
This environment includes the following tools and utilities:

- Kubernetes (via K3s): For lightweight local Kubernetes clusters.
- kubectl: The official Kubernetes command-line tool for cluster management.
- helm: A Kubernetes package manager for deploying applications.
- kustomize: A tool for customizing Kubernetes resource files.
- k9s: A terminal-based UI to interact with Kubernetes clusters.
- terraform: Infrastructure-as-Code tool for managing cloud resources.
- FRP: Fast Reverse Proxy for securely exposing local services.
- go, nodejs, python, poetry, jq, and other development tools.
### Customization
If you'd like to add more tools or modify the environment for your specific needs, you can easily update the devbox.json configuration file. Simply add your desired packages to the "packages" array, and adjust the initialization scripts as needed.

## Contributing
Feel free to fork this repository and submit pull requests with improvements, bug fixes, or new features. If you encounter any issues, please report them in the Issues section of the repository.

## License
This project is licensed under the MIT License - see the LICENSE file for details.

