#!/bin/bash

# Vérifier si l'utilisateur a les privilèges d'administration (root) pour installer les paquets
if [[ $EUID -ne 0 ]]; then
    echo "Ce script doit être exécuté en tant qu'administrateur (root)."
    exit 1
fi

# Mettre à jour les informations sur les paquets
apt update

# Installer les paquets Meson, Ninja et libbsd-dev
apt install -y meson ninja-build libbsd-dev git 

# Vérifier si l'installation a réussi
if [ $? -eq 0 ]; then
    echo "L'installation de Meson, Ninja et libbsd-dev git  est terminée avec succès."
else
    echo "Une erreur s'est produite lors de l'installation des paquets."
fi

echo "Repo Clone"
git clone https://github.com/loic564492/xget/

echo "Building The App ...."
meson setup build
ninja -C build
