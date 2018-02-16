# SNMP

## Client

### Installation

Installez le paquet du client :

	apt install snmp


## Serveur

### Installation

Installez le paquet du serveur SNMP :

	apt install snmpd

### Configuration

Sauvegardez et éditez le fichier de configuration du serveur `/etc/snmp/snmpd.conf` :

	#
	# SNMP Server Configuration
	#

	# Listen for connections on all interfaces (both IPv4 *and* IPv6)
	agentAddress udp:161,udp6:[::1]:161

	# Full access for all
	rocommunity public
	rocommunity6 public

### Lancement

Redémarrez le service snmp :

	systemctl restart snmpd


## MIBs

### Installation

Installez le paquet des MIBs :

	apt install snmp-mibs-downloader

### Configuration

	# Load MIBs by default
	sed -i 's/export MIBS=/#export MIBS=/' /etc/default/snmpd
	sed -i 's/:mibs/#:mibs/' /etc/snmp/snmp.conf


