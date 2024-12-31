 
#!/bin/bash

# # Check for root privileges
# if [[ $EUID -ne 0 ]]; then
#    echo "This script must be run as root. Use sudo." 
#    exit 1
# fi



echo "Installing K3s..."
curl -sfL https://get.k3s.io | sh -

echo "Configuring kubectl for the current user..."
USER_HOME=$(eval echo ~${SUDO_USER:-$USER})
USER_NAME=${SUDO_USER:-$USER}

# Set up kubeconfig for the user
mkdir -p "$USER_HOME/.kube"
cp /etc/rancher/k3s/k3s.yaml "$USER_HOME/.kube/config"
chown -R "$USER_NAME:$USER_NAME" "$USER_HOME/.kube"
chmod 600 "$USER_HOME/.kube/config"

echo "K3s configuration has been copied to $USER_HOME/.kube/config"

export KUBEVERSION=$(kubectl version --short | awk -F ': ' 'NR==1 {print $2}')
echo 'K3s cluster started with version $KUBEVERSION'
