 
#!/bin/bash

# # Check for root privileges
# if [[ $EUID -ne 0 ]]; then
#    echo "This script must be run as root. Use sudo." 
#    exit 1
# fi



echo "Installing K3s..."
#curl -sfL https://get.k3s.io | sh -

echo "Configuring kubectl for the current user..."
USER_HOME=$(eval echo ~${SUDO_USER:-$USER})
USER_NAME=${SUDO_USER:-$USER}

echo "userhome = $USER_HOME"
echo "username = $USER_NAME"

# Set up kubeconfig for the user
mkdir -p "$USER_HOME/.kube"
sudo cp /etc/rancher/k3s/k3s.yaml "$USER_HOME/.kube/config"
sudo chown -R "$USER_NAME:$USER_NAME" "$USER_HOME/.kube"
sudo chmod 600 "$USER_HOME/.kube/config"

echo "K3s configuration has been copied to $USER_HOME/.kube/config"

# Define the line to add
LINE="export KUBECONFIG=$USER_HOME/.kube/config"

# Check if the line already exists in .bashrc
if ! grep -Fxq "$LINE" "$USER_HOME/.bashrc"; then
  echo "$LINE" >> "$USER_HOME/.bashrc"
  echo "Added KUBECONFIG export to $USER_HOME/.bashrc"
else
  echo "KUBECONFIG export already exists in $USER_HOME/.bashrc"
fi

# export KUBEVERSION=$(kubectl version --short | awk -F ': ' 'NR==1 {print $2}')
# echo 'K3s cluster started with version $KUBEVERSION'
