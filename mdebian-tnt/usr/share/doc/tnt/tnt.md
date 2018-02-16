
# Streaming de la télévision TNT

## Configuration de la carte WinTV USB sous Linux

Documentation :	https://www.linuxtv.org/wiki/index.php/Hauppauge_WinTV-dualHD

Téléchargement du firmware :

	wget http://palosaari.fi/linux/v4l-dvb/firmware/Si2168/Si2168-B40/4.0.25/dvb-demod-si2168-b40-01.fw

Installation du firmware :

	cp dvb-demod-si2168-b40-01.fw /lib/firmware/
	reboot

## Scan des chaines

	apt install w-scan dvb-apps dtv-scan-tables dvb-tools

	w_scan > channels.conf
	w_scan -L > channels.xspf

	scan /usr/share/dvb/dvb-legacy/dvb-t/fr-All

## Diffusion de la TNT

Installation de dvblast :

	apt install dvblast

Fichier de configuration `/etc/dvblast/tnt` :

	230.0.0.1:5000 1 1031 # Arte
	230.0.0.2:5000 1 1045 # France 5

Activation du stream vidéo :

	dvblast --frequency 554000000 --config-file /etc/dvblast/tnt

	# dvblast -a 0 -f 554000000 -c conf-5 -m QAM_64 -b 8 -e
	# dvblast -f 554000000 -c conf-5

Lecture du stream vidéo :

	vlc rtp://230.0.0.1:5000
	vlc rtp://230.0.0.2:5000

## Raspberry

	IP : 10.0.36.200 /24
	SSH : etudiant / tprezo