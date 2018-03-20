#!/bin/sh

TYPE=unknown

[ -e /usr/share/pve-manager/ext4/pvemanagerlib.js ] && TYPE=ext4
[ -e /usr/share/pve-manager/ext6/pvemanagerlib.js ] && TYPE=ext6
[ -e /usr/share/pve-manager/js/pvemanagerlib.js ] && TYPE=js


case "$TYPE" in
    ext4)
        if [ $( grep -c "if (data.status !== 'Active') {" /usr/share/pve-manager/ext4/pvemanagerlib.js ) -gt 0 ]
        then
            echo "---------------[ Patching with No-Subscription-Removal-Patch ]----------------"
            cd / && patch --no-backup-if-mismatch -l -p0 < /usr/share/pve-no-subscription/no-subscription-warning-ext4.patch
            echo "------------------------------------------------------------------------------"
        fi
        ;;

    ext6)
        if [ $( grep -c "if (data.status !== 'Active') {" /usr/share/pve-manager/ext6/pvemanagerlib.js ) -gt 0 ]
        then
        	echo "---------------[ Patching with No-Subscription-Removal-Patch ]----------------"
        	cd / && patch --no-backup-if-mismatch -l -p0 < /usr/share/pve-no-subscription/no-subscription-warning-ext6.patch
        	echo "------------------------------------------------------------------------------"
        fi
        ;;
    js)
        if [ $( grep -c "if (data.status !== 'Active') {" /usr/share/pve-manager/js/pvemanagerlib.js ) -gt 0 ]
        then
        	echo "---------------[ Patching with No-Subscription-Removal-Patch ]----------------"
        	cd / && patch --no-backup-if-mismatch -l -p0 < /usr/share/pve-no-subscription/no-subscription-warning-js.patch
        	echo "------------------------------------------------------------------------------"
        fi

        if [ $( grep -c "if (data.status !== 'Active') {" /usr/share/javascript/proxmox-widget-toolkit/proxmoxlib.js ) -gt 0 ]
        then
        	echo "---------------[ Patching with No-Subscription-Removal-Patch ]----------------"
        	cd / && patch --no-backup-if-mismatch -l -p0 < /usr/share/pve-no-subscription/no-subscription-warning-js2.patch
        	echo "------------------------------------------------------------------------------"
        fi
        ;;

    *)
        echo "Unknown Type! Sourcefile not found!"
        ;;
esac
