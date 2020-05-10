#!/bin/bash

PATCHED=0

if [ $( grep -c "if (data.status !== 'Active') {" /usr/share/javascript/proxmox-widget-toolkit/proxmoxlib.js ) -gt 0 ]
then
	PATCHED=1
	cd / && patch --no-backup-if-mismatch -l -p0 < /usr/share/pve-no-subscription/proxmoxlib.patch
fi

if [ $( grep -c "<h1>No valid subscription</h1>" /usr/share/pve-manager/js/pvemanagerlib.js ) -gt 0 ]
then
	PATCHED=1
	cd / && patch --no-backup-if-mismatch -l -p0 < /usr/share/pve-no-subscription/pvemanagerlib.patch
fi

if [ "$PATCHED" == "1" ]
then
	systemctl restart pvedaemon
	systemctl restart pveproxy
fi
