#! /bin/sh

# Select the different configurations to install
SELECT=$(whiptail --title "mdebian-server" --checklist --separate-output \
"Choose custom configurations :" 20 78 1 \
"snmpd" "Configure the SNMP service" OFF \
"syslog-ng" "Configure the syslog-ng service" OFF \
3>&1 1>&2 2>&3)

# No option selected or canceled
[ "$SELECT" ] || exit 1

# Define the package list
PKG=""
for I in $SELECT; do
	PKG=$PKG" mdebian-$I*.deb"
done

# Install the packages
sudo dpkg -i $PKG

# Install the dependencies
sudo apt -f install
