# Proxmox VE No-Subscription Patch

This patch removes the 'No valid subscription' warning in Proxmox VE and should only be used
in test or demo environments. Please consider [buying a subscription](https://www.proxmox.com/en/proxmox-ve/pricing)
and supporting the development of Proxmox VE.

## How to install

Navigate to the [releases](https://github.com/lnxbil/pve-no-subscription/releases), copy the link to the latest .deb package. On your Proxmox server, download and then install the package, e.g.
```
wget https://github.com/lnxbil/pve-no-subscription/releases/download/1.5/pve-no-subscription_1.5_all.deb
dpkg -i pve-no-subscription_1.5_all.deb
```
Navigate to your Proxmox web interface, then refresh. If necessary, clear your browser cache. 


## Technical Implementation

The patch does automatically be invoked after a package update. It is built as
an APT hook that automagically applies the patch if necessary.
