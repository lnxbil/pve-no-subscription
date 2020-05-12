# Proxmox VE No-Subscription Removal Patch (Version 6 only)

This patch removes the 'No valid subscription' warning in Proxmox VE 6 and should only be used
in test or demo environments. Please consider [buying a subscription](https://www.proxmox.com/en/proxmox-ve/pricing)
and supporting the development of Proxmox VE.

This package also includes the `pve-no-subscription` APT repository, so you just need this in a
home setup.

## How to install

Navigate to the [releases](https://github.com/lnxbil/pve-no-subscription/releases), copy the link to the latest `.deb` package.
On your Proxmox VE server, download and then install the package, e.g.

```
wget https://github.com/lnxbil/pve-no-subscription/releases/download/v1.6/pve-no-subscription_1.6_all.deb
dpkg -i pve-no-subscription_1.6_all.deb
```

The corresponding daemons `pvedaemon` and `pveproxy` are automatically restarted.
Navigate to your Proxmox VE web interface, then refresh. If necessary, clear your browser cache. 

## How to uninstall

Remove the package itself

    apt-get purge pve-no-subscription

Reinstall the packages that were altered:

    apt-get install --reinstall pve-manager proxmox-widget-toolkit


## Technical Implementation

The patch does automatically be invoked after a package update. It is built as
an APT hook that automagically applies the patch if necessary.
