#!/bin/sh

if [ $( grep -c "if (data.status !== 'Active') {" /usr/share/pve-manager/ext4/pvemanagerlib.js ) -gt 0 ]
then
	echo "---------------[ Patching with No-Subscription-Removal-Patch ]----------------"
	cd / && patch --no-backup-if-mismatch -l -p0 < /usr/share/pve-no-subscription/no-subscription-warning.patch
	echo "------------------------------------------------------------------------------"
fi
